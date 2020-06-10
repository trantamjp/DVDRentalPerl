use utf8;

package DAO::DVDRental::Result::SaleByStore;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DAO::DVDRental::Result::SaleByStore

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

=head1 TABLE: C<sales_by_store>

=cut

__PACKAGE__->table("sales_by_store");
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(<<__END_SQL__);
 SELECT (c.city || ',') || cy.country AS store,
    (m.first_name || ' ') || m.last_name AS manager,
    sum(p.amount) AS total_sales
   FROM payment p
     JOIN rental r ON p.rental_id = r.rental_id
     JOIN inventory i ON r.inventory_id = i.inventory_id
     JOIN store s ON i.store_id = s.store_id
     JOIN address a ON s.address_id = a.address_id
     JOIN city c ON a.city_id = c.city_id
     JOIN country cy ON c.country_id = cy.country_id
     JOIN staff m ON s.manager_staff_id = m.staff_id
  GROUP BY cy.country, c.city, s.store_id, m.first_name, m.last_name
  ORDER BY cy.country, c.city
__END_SQL__

=head1 ACCESSORS

=head2 store

  data_type: 'text'
  is_nullable: 1

=head2 manager

  data_type: 'text'
  is_nullable: 1

=head2 total_sales

  data_type: 'numeric'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "store",
    {
        data_type   => "text",
        is_nullable => 1
    },
    "manager",
    {
        data_type   => "text",
        is_nullable => 1
    },
    "total_sales",
    {
        data_type   => "numeric",
        is_nullable => 1
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-10 08:18:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eKRM5a6S5oM+ZqywBBFz3g

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
