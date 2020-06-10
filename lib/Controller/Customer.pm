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
    my ($query_params) = @_;

    my $rs            = schema('dvdrental')->resultset('CustomerList');
    my $records_total = $rs->count;

    # apply search filters
    my $search_value = $query_params->get('search[value]') // '';
    my $rs_filtered  = ($search_value eq '') ? $rs->search() : $rs->search([
        { name     => { -like => '%' . $search_value . '%' } },
        { address  => { -like => '%' . $search_value . '%' } },
        { zip_code => { -like => '%' . $search_value . '%' } },
        { phone    => { -like => '%' . $search_value . '%' } },
        { city     => { -like => '%' . $search_value . '%' } },
        { country  => { -like => '%' . $search_value . '%' } },
        { notes    => { -like => '%' . $search_value . '%' } },
    ]);
    my $records_filtered = $rs_filtered->count;

    # get paging data
    my @order_by = ();
    foreach my $order_i (0 .. 7) {
        my $order_col = $query_params->get("order[$order_i][column]") // '';
        last if $order_col eq '';

        my $order_column_name = {
            '0' => 'name',
            '1' => 'address',
            '2' => 'city',
            '3' => 'zip_code',
            '4' => 'country',
            '5' => 'phone',
            '6' => 'notes',
        }->{$order_col} or next;
        my $order_dir = $query_params->get("order[$order_i][dir]") || 'asc';

        push @order_by, { "-$order_dir" => $order_column_name };
    }

    my $rs_filtered_paging = $rs_filtered->search(
        undef,
        {
            order_by => \@order_by,
            rows     => $query_params->get('length') || 10,
            offset   => $query_params->get('start') || 0,
        });

    $rs_filtered_paging->result_class('DBIx::Class::ResultClass::HashRefInflator');
    my $customers = [ $rs_filtered_paging->all ];

    my $response = {
        draw            => $query_params->get('draw'),
        recordsTotal    => $records_total,
        recordsFiltered => $records_filtered,
        data            => $customers,
    };
    return $response;
}

1;
