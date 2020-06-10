package Controller::Film;

use strict;
use warnings;

use Dancer2;
use Dancer2::Plugin::DBIC;
use DBIx::Class::ResultClass::HashRefInflator;

=head1 NAME

Controller::Film

=cut

=head2 get_list

  Get the list of films

=cut

sub get_list {
    my ($query_params) = @_;

    my $rs            = schema('dvdrental')->resultset('FilmList');
    my $records_total = $rs->count;

    # apply search filters
    my $search_value = $query_params->get('search[value]');
    my $rs_filtered  = $rs->search([
        { title       => { -like => '%' . $search_value . '%' } },
        { description => { -like => '%' . $search_value . '%' } },
        { category    => { -like => '%' . $search_value . '%' } },
        { actors      => { -like => '%' . $search_value . '%' } },
    ]);
    my $records_filtered = $rs_filtered->count;

    # get paging data
    my @order_by = ();
    foreach my $order_i (0 .. 7) {
        my $order_col = $query_params->get("order[$order_i][column]") // '';
        last if $order_col eq '';

        my $order_column_name = {
            '0' => 'title',
            '1' => 'category',
            '2' => 'description',
            '3' => 'actors',
            '4' => 'length',
            '5' => 'rating',
            '6' => 'price',
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
