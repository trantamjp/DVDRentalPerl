use utf8;

package DAO::DVDRental::Result::Actor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DAO::DVDRental::Result::Actor

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

=head1 TABLE: C<actor>

=cut

__PACKAGE__->table("actor");

=head1 ACCESSORS

=head2 actor_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'actor_actor_id_seq'

=head2 first_name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 last_name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 last_update

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
    "actor_id",
    {
        data_type         => "integer",
        is_auto_increment => 1,
        is_nullable       => 0,
        sequence          => "actor_actor_id_seq",
    },
    "first_name",
    {
        data_type   => "varchar",
        is_nullable => 0,
        size        => 45
    },
    "last_name",
    {
        data_type   => "varchar",
        is_nullable => 0,
        size        => 45
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

=item * L</actor_id>

=back

=cut

__PACKAGE__->set_primary_key("actor_id");

=head1 RELATIONS

=head2 film_actors

Type: has_many

Related object: L<DAO::DVDRental::Result::FilmActor>

=cut

__PACKAGE__->has_many(
    "film_actors",
    "DAO::DVDRental::Result::FilmActor",
    { "foreign.actor_id" => "self.actor_id" },
    {
        cascade_copy   => 0,
        cascade_delete => 0
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-10 08:18:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:3TqM+FYu5RZgxPTUIk8Vhg

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
