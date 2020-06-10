use utf8;

package DAO::DVDRental::Result::ActorInfo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DAO::DVDRental::Result::ActorInfo

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

=head1 TABLE: C<actor_info>

=cut

__PACKAGE__->table("actor_info");
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(<<__END_SQL__);
 SELECT a.actor_id,
    a.first_name,
    a.last_name,
    group_concat(DISTINCT (c.name || ': ') || (( SELECT group_concat(f.title) AS group_concat
           FROM film f
             JOIN film_category fc_1 ON f.film_id = fc_1.film_id
             JOIN film_actor fa_1 ON f.film_id = fa_1.film_id
          WHERE fc_1.category_id = c.category_id AND fa_1.actor_id = a.actor_id
          GROUP BY fa_1.actor_id))) AS film_info
   FROM actor a
     LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
     LEFT JOIN film_category fc ON fa.film_id = fc.film_id
     LEFT JOIN category c ON fc.category_id = c.category_id
  GROUP BY a.actor_id, a.first_name, a.last_name
__END_SQL__

=head1 ACCESSORS

=head2 actor_id

  data_type: 'integer'
  is_nullable: 1

=head2 first_name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 last_name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 film_info

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "actor_id",
    {
        data_type   => "integer",
        is_nullable => 1
    },
    "first_name",
    {
        data_type   => "varchar",
        is_nullable => 1,
        size        => 45
    },
    "last_name",
    {
        data_type   => "varchar",
        is_nullable => 1,
        size        => 45
    },
    "film_info",
    {
        data_type   => "text",
        is_nullable => 1
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-10 08:18:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7IcuStxF0n97qJo6r0/DcQ

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
