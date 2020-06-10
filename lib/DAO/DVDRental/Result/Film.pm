use utf8;

package DAO::DVDRental::Result::Film;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DAO::DVDRental::Result::Film

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

=head1 TABLE: C<film>

=cut

__PACKAGE__->table("film");

=head1 ACCESSORS

=head2 film_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'film_film_id_seq'

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 release_year

  data_type: 'year'
  is_nullable: 1
  size: 4

=head2 language_id

  data_type: 'smallint'
  is_foreign_key: 1
  is_nullable: 0

=head2 rental_duration

  data_type: 'smallint'
  default_value: 3
  is_nullable: 0

=head2 rental_rate

  data_type: 'numeric'
  default_value: 4.99
  is_nullable: 0
  size: [4,2]

=head2 length

  data_type: 'smallint'
  is_nullable: 1

=head2 replacement_cost

  data_type: 'numeric'
  default_value: 19.99
  is_nullable: 0
  size: [5,2]

=head2 rating

  data_type: 'enum'
  default_value: 'G'
  extra: {custom_type_name => "mpaa_rating",list => ["G","PG","PG-13","R","NC-17"]}
  is_nullable: 1

=head2 last_update

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=head2 special_features

  data_type: 'text[]'
  is_nullable: 1

=head2 fulltext

  data_type: 'tsvector'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "film_id",
    {
        data_type         => "integer",
        is_auto_increment => 1,
        is_nullable       => 0,
        sequence          => "film_film_id_seq",
    },
    "title",
    {
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255
    },
    "description",
    {
        data_type   => "text",
        is_nullable => 1
    },
    "release_year",
    {
        data_type   => "year",
        is_nullable => 1,
        size        => 4
    },
    "language_id",
    {
        data_type      => "smallint",
        is_foreign_key => 1,
        is_nullable    => 0
    },
    "rental_duration",
    {
        data_type     => "smallint",
        default_value => 3,
        is_nullable   => 0
    },
    "rental_rate",
    {
        data_type     => "numeric",
        default_value => 4.99,
        is_nullable   => 0,
        size          => [ 4, 2 ],
    },
    "length",
    {
        data_type   => "smallint",
        is_nullable => 1
    },
    "replacement_cost",
    {
        data_type     => "numeric",
        default_value => 19.99,
        is_nullable   => 0,
        size          => [ 5, 2 ],
    },
    "rating",
    {
        data_type     => "enum",
        default_value => "G",
        extra         => {
            custom_type_name => "mpaa_rating",
            list             => [ "G", "PG", "PG-13", "R", "NC-17" ],
        },
        is_nullable => 1,
    },
    "last_update",
    {
        data_type     => "timestamp",
        default_value => \"current_timestamp",
        is_nullable   => 0,
        original      => { default_value => \"now()" },
    },
    "special_features",
    {
        data_type   => "text[]",
        is_nullable => 1
    },
    "fulltext",
    {
        data_type   => "tsvector",
        is_nullable => 0
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</film_id>

=back

=cut

__PACKAGE__->set_primary_key("film_id");

=head1 RELATIONS

=head2 film_actors

Type: has_many

Related object: L<DAO::DVDRental::Result::FilmActor>

=cut

__PACKAGE__->has_many(
    "film_actors",
    "DAO::DVDRental::Result::FilmActor",
    { "foreign.film_id" => "self.film_id" },
    {
        cascade_copy   => 0,
        cascade_delete => 0
    },
);

=head2 film_categories

Type: has_many

Related object: L<DAO::DVDRental::Result::FilmCategory>

=cut

__PACKAGE__->has_many(
    "film_categories",
    "DAO::DVDRental::Result::FilmCategory",
    { "foreign.film_id" => "self.film_id" },
    {
        cascade_copy   => 0,
        cascade_delete => 0
    },
);

=head2 inventories

Type: has_many

Related object: L<DAO::DVDRental::Result::Inventory>

=cut

__PACKAGE__->has_many(
    "inventories",
    "DAO::DVDRental::Result::Inventory",
    { "foreign.film_id" => "self.film_id" },
    {
        cascade_copy   => 0,
        cascade_delete => 0
    },
);

=head2 language

Type: belongs_to

Related object: L<DAO::DVDRental::Result::Language>

=cut

__PACKAGE__->belongs_to(
    "language",
    "DAO::DVDRental::Result::Language",
    { language_id => "language_id" },
    {
        is_deferrable => 0,
        on_delete     => "RESTRICT",
        on_update     => "CASCADE"
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-10 08:18:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZfjRm5xkxHv1iEobtvqYtg

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
