use utf8;

package DAO::DVDRental::Result::Rental;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DAO::DVDRental::Result::Rental

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

=head1 TABLE: C<rental>

=cut

__PACKAGE__->table("rental");

=head1 ACCESSORS

=head2 rental_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'rental_rental_id_seq'

=head2 rental_date

  data_type: 'timestamp'
  is_nullable: 0

=head2 inventory_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 customer_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 return_date

  data_type: 'timestamp'
  is_nullable: 1

=head2 staff_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 last_update

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
    "rental_id",
    {
        data_type         => "integer",
        is_auto_increment => 1,
        is_nullable       => 0,
        sequence          => "rental_rental_id_seq",
    },
    "rental_date",
    {
        data_type   => "timestamp",
        is_nullable => 0
    },
    "inventory_id",
    {
        data_type      => "integer",
        is_foreign_key => 1,
        is_nullable    => 0
    },
    "customer_id",
    {
        data_type      => "smallint",
        is_foreign_key => 1,
        is_nullable    => 0
    },
    "return_date",
    {
        data_type   => "timestamp",
        is_nullable => 1
    },
    "staff_id",
    {
        data_type      => "smallint",
        is_foreign_key => 1,
        is_nullable    => 0
    },
    "last_update",
    {
        data_type     => "timestamp",
        default_value => \"current_timestamp",
        is_nullable   => 0,
        original      => { default_value => \"now()" },
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</rental_id>

=back

=cut

__PACKAGE__->set_primary_key("rental_id");

=head1 UNIQUE CONSTRAINTS

=head2 C<idx_unq_rental_rental_date_inventory_id_customer_id>

=over 4

=item * L</rental_date>

=item * L</inventory_id>

=item * L</customer_id>

=back

=cut

__PACKAGE__->add_unique_constraint(
    "idx_unq_rental_rental_date_inventory_id_customer_id",
    [ "rental_date", "inventory_id", "customer_id" ],
);

=head1 RELATIONS

=head2 customer

Type: belongs_to

Related object: L<DAO::DVDRental::Result::Customer>

=cut

__PACKAGE__->belongs_to(
    "customer",
    "DAO::DVDRental::Result::Customer",
    { customer_id => "customer_id" },
    {
        is_deferrable => 0,
        on_delete     => "RESTRICT",
        on_update     => "CASCADE"
    },
);

=head2 inventory

Type: belongs_to

Related object: L<DAO::DVDRental::Result::Inventory>

=cut

__PACKAGE__->belongs_to(
    "inventory",
    "DAO::DVDRental::Result::Inventory",
    { inventory_id => "inventory_id" },
    {
        is_deferrable => 0,
        on_delete     => "RESTRICT",
        on_update     => "CASCADE"
    },
);

=head2 payments

Type: has_many

Related object: L<DAO::DVDRental::Result::Payment>

=cut

__PACKAGE__->has_many(
    "payments",
    "DAO::DVDRental::Result::Payment",
    { "foreign.rental_id" => "self.rental_id" },
    {
        cascade_copy   => 0,
        cascade_delete => 0
    },
);

=head2 staff

Type: belongs_to

Related object: L<DAO::DVDRental::Result::Staff>

=cut

__PACKAGE__->belongs_to(
    "staff",
    "DAO::DVDRental::Result::Staff",
    { staff_id => "staff_id" },
    {
        is_deferrable => 0,
        on_delete     => "NO ACTION",
        on_update     => "NO ACTION"
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-10 08:18:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YkXfoilvRkmVDUIHwZrFJA

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
