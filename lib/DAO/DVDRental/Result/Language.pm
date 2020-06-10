use utf8;

package DAO::DVDRental::Result::Language;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DAO::DVDRental::Result::Language

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

=head1 TABLE: C<language>

=cut

__PACKAGE__->table("language");

=head1 ACCESSORS

=head2 language_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'language_language_id_seq'

=head2 name

  data_type: 'char'
  is_nullable: 0
  size: 20

=head2 last_update

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
    "language_id",
    {
        data_type         => "integer",
        is_auto_increment => 1,
        is_nullable       => 0,
        sequence          => "language_language_id_seq",
    },
    "name",
    {
        data_type   => "char",
        is_nullable => 0,
        size        => 20
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

=item * L</language_id>

=back

=cut

__PACKAGE__->set_primary_key("language_id");

=head1 RELATIONS

=head2 films

Type: has_many

Related object: L<DAO::DVDRental::Result::Film>

=cut

__PACKAGE__->has_many(
    "films",
    "DAO::DVDRental::Result::Film",
    { "foreign.language_id" => "self.language_id" },
    {
        cascade_copy   => 0,
        cascade_delete => 0
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-10 08:18:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TfEn+UoykEHM16VZvJq6og

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
