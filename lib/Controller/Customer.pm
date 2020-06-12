package Controller::Customer;

use strict;
use warnings;

use Dancer2;
use Dancer2::Plugin::DBIC;
use DBIx::Class::ResultClass::HashRefInflator;

=head1 NAME

Controller::Customer

=cut

=head2 get_list

  Get the list of customers

=cut

sub get_list {
    my ($args) = @_;

    my $start   = $args->{'start'}   // 0;
    my $length  = $args->{'length'}  // 10;
    my $orders  = $args->{'order'}   // [];
    my $search  = $args->{'search'}  // {};
    my $columns = $args->{'columns'} // [];

    my $rs            = schema('dvdrental')->resultset('CustomerList');
    my $records_total = $rs->count;

    # apply search filters
    my $search_value = $search->{'value'} // '';
    my @filters      = ();
    my $dbh          = schema('dvdrental')->storage->dbh;
    foreach my $column (@$columns) {
        next unless $column->{'searchable'};

        my $column_search_value = $column->{'search'}{'value'} // '';
        $column_search_value = $search_value if $column_search_value eq '';

        if ($column_search_value ne '') {
            $column_search_value = '%' . lc($column_search_value) . '%';
            my $column_name = $column->{'data'} or next;
            push @filters,
                \[
                'LOWER(' . $dbh->quote_identifier($column_name) . ') LIKE ?',
                $column_search_value
                ];
        }
    }

    my $rs_filtered      = (scalar @filters == 0) ? $rs->search() : $rs->search([@filters]);
    my $records_filtered = $rs_filtered->count;

    # get paging data
    my @order_by = ();
    foreach my $order (@$orders) {
        next unless $order->{'column'} =~ /^\d+$/;
        my $column = $columns->[ $order->{'column'} ] or next;

        my $order_column_name = $column->{'data'};
        my $order_dir         = $order->{'dir'} eq 'desc' ? '-desc' : '-asc';

        push @order_by, { $order_dir => $order_column_name };
    }

    my $rs_filtered_paging = $rs_filtered->search(
        undef,
        {
            order_by => \@order_by,
            rows     => $length,
            offset   => $start,
        });

    $rs_filtered_paging->result_class('DBIx::Class::ResultClass::HashRefInflator');
    my $customers = [ $rs_filtered_paging->all ];

    my $response = {
        draw            => $args->{'draw'},
        recordsTotal    => $records_total,
        recordsFiltered => $records_filtered,
        data            => $customers,
    };
    return $response;
}

1;
