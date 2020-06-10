use utf8;

package DAO::DVDRental::Result::StaffList;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DAO::DVDRental::Result::StaffList

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

=head1 TABLE: C<staff_list>

=cut

__PACKAGE__->table("staff_list");
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(<<__END_SQL__);
 SELECT s.staff_id AS id,
    (s.first_name || ' ') || s.last_name AS name,
    a.address,
    a.postal_code AS zip_code,
    a.phone,
    city.city,
    country.country,
    s.store_id AS sid
   FROM staff s
     JOIN address a ON s.address_id = a.address_id
     JOIN city ON a.city_id = city.city_id
     JOIN country ON city.country_id = country.country_id
__END_SQL__

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 1

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 address

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 zip_code

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 phone

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 city

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 country

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 sid

  data_type: 'smallint'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "id",
    {
        data_type   => "integer",
        is_nullable => 1
    },
    "name",
    {
        data_type   => "text",
        is_nullable => 1
    },
    "address",
    {
        data_type   => "varchar",
        is_nullable => 1,
        size        => 50
    },
    "zip_code",
    {
        data_type   => "varchar",
        is_nullable => 1,
        size        => 10,
    },
    "phone",
    {
        data_type   => "varchar",
        is_nullable => 1,
        size        => 20
    },
    "city",
    {
        data_type   => "varchar",
        is_nullable => 1,
        size        => 50
    },
    "country",
    {
        data_type   => "varchar",
        is_nullable => 1,
        size        => 50
    },
    "sid",
    {
        data_type   => "smallint",
        is_nullable => 1
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-10 08:18:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:83k6PW56G9ZeZLvpuvVnag

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
