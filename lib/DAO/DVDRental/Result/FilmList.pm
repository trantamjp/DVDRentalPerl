use utf8;

package DAO::DVDRental::Result::FilmList;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DAO::DVDRental::Result::FilmList

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

=head1 TABLE: C<film_list>

=cut

__PACKAGE__->table("film_list");
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(<<__END_SQL__);
 SELECT film.film_id AS fid,
    film.title,
    film.description,
    category.name AS category,
    film.rental_rate AS price,
    film.length,
    film.rating,
    group_concat((actor.first_name || ' ') || actor.last_name) AS actors
   FROM category
     LEFT JOIN film_category ON category.category_id = film_category.category_id
     LEFT JOIN film ON film_category.film_id = film.film_id
     JOIN film_actor ON film.film_id = film_actor.film_id
     JOIN actor ON film_actor.actor_id = actor.actor_id
  GROUP BY film.film_id, film.title, film.description, category.name, film.rental_rate, film.length, film.rating
__END_SQL__

=head1 ACCESSORS

=head2 fid

  data_type: 'integer'
  is_nullable: 1

=head2 title

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 category

  data_type: 'varchar'
  is_nullable: 1
  size: 25

=head2 price

  data_type: 'numeric'
  is_nullable: 1
  size: [4,2]

=head2 length

  data_type: 'smallint'
  is_nullable: 1

=head2 rating

  data_type: 'enum'
  extra: {custom_type_name => "mpaa_rating",list => ["G","PG","PG-13","R","NC-17"]}
  is_nullable: 1

=head2 actors

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "fid",
    {
        data_type   => "integer",
        is_nullable => 1
    },
    "title",
    {
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255
    },
    "description",
    {
        data_type   => "text",
        is_nullable => 1
    },
    "category",
    {
        data_type   => "varchar",
        is_nullable => 1,
        size        => 25
    },
    "price",
    {
        data_type   => "numeric",
        is_nullable => 1,
        size        => [ 4, 2 ]
    },
    "length",
    {
        data_type   => "smallint",
        is_nullable => 1
    },
    "rating",
    {
        data_type => "enum",
        extra     => {
            custom_type_name => "mpaa_rating",
            list             => [ "G", "PG", "PG-13", "R", "NC-17" ],
        },
        is_nullable => 1,
    },
    "actors",
    {
        data_type   => "text",
        is_nullable => 1
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-10 08:18:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Xk1tLZ2JV2+uibzI91zhqg

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
