use utf8;

package DAO::DVDRental::Result::SaleByFilmCategory;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DAO::DVDRental::Result::SaleByFilmCategory

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<sales_by_film_category>

=cut

__PACKAGE__->table("sales_by_film_category");
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(<<__END_SQL__);
 SELECT c.name AS category,
    sum(p.amount) AS total_sales
   FROM payment p
     JOIN rental r ON p.rental_id = r.rental_id
     JOIN inventory i ON r.inventory_id = i.inventory_id
     JOIN film f ON i.film_id = f.film_id
     JOIN film_category fc ON f.film_id = fc.film_id
     JOIN category c ON fc.category_id = c.category_id
  GROUP BY c.name
  ORDER BY (sum(p.amount)) DESC
__END_SQL__

=head1 ACCESSORS

=head2 category

  data_type: 'varchar'
  is_nullable: 1
  size: 25

=head2 total_sales

  data_type: 'numeric'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "category",
    {
        data_type   => "varchar",
        is_nullable => 1,
        size        => 25
    },
    "total_sales",
    {
        data_type   => "numeric",
        is_nullable => 1
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-10 08:18:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PGWSgBMoi7fMfjDqSIY3Gw

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
