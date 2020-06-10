use strict;
use warnings;

use Test::More;
use Test::MockModule;
use Hash::MultiValue;

use Controller::Customer;

use Test::DBIx::Class {
    schema_class => 'DAO::DVDRental',
    connect_info => [ 'dbi:SQLite:dbname=:memory:', '', '' ],
    connect_opts => {
        name_sep   => '.',
        quote_char => '`',
    },
    fixture_class => '::Populate',
    },
    'Country', 'City', 'Address', 'Customer', 'CustomerList';

fixtures_ok 'basic' => 'installed the basic fixtures from configuration files';

my $customer_module = Test::MockModule->new('Controller::Customer');
$customer_module->mock('schema', sub { return Schema });

{
    my $query_params = Hash::MultiValue->new(
        'length'           => 1,
        'draw'             => 10,
        'order[0][column]' => 0,
        'order[0][dir]'    => 'asc',
    );
    my $response = Controller::Customer::get_list($query_params);
    my $expected = {
        'recordsTotal' => 10,
        'data'         => [ {
                'address'  => '1566 Inegl Manor',
                'notes'    => 'active',
                'phone'    => '705814003527',
                'zip_code' => '53561',
                'id'       => 4,
                'city'     => 'Myingyan',
                'name'     => 'Barbara Jones',
                'sid'      => 2,
                'country'  => 'Myanmar'
            }
        ],
        'draw'            => 10,
        'recordsFiltered' => 10
    };

    is_deeply $response, $expected, "get_list() without filters";
}

{
    my $query_params = Hash::MultiValue->new(
        'length'           => 1,
        'draw'             => 10,
        'order[0][column]' => 0,
        'order[0][dir]'    => 'asc',
        'search[value]'    => 'Mar',
    );
    my $response = Controller::Customer::get_list($query_params);
    my $expected = {
        'data' => [ {
                'name'     => 'Barbara Jones',
                'sid'      => 2,
                'notes'    => 'active',
                'country'  => 'Myanmar',
                'address'  => '1566 Inegl Manor',
                'id'       => 4,
                'phone'    => '705814003527',
                'zip_code' => '53561',
                'city'     => 'Myingyan'
            }
        ],
        'draw'            => 10,
        'recordsTotal'    => 10,
        'recordsFiltered' => 4
    };

    is_deeply $response, $expected, "get_list() with filters";
}
$customer_module->unmock_all();

done_testing;
