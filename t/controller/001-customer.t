use strict;
use warnings;

use Test::More;
use Test::MockModule;

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
    my $query_params = {
        'length' => 1,
        'draw'   => 10,
        'order'  => [ {
                'column' => 1,
                'dir'    => 'asc'
            },
        ] };
    my $response = Controller::Customer::get_list($query_params);

    ok($response->{'draw'} eq 10);
    ok($response->{'recordsFiltered'} eq 10);
    ok($response->{'recordsTotal'} eq 10);
    ok(scalar(@{ $response->{'data'} }) eq 1);

}

{
    my $query_params = {
        'order' => [ {
                'dir'    => 'asc',
                'column' => 0
            }
        ],
        'length' => 1,
        'search' => {
            'value' => 'Myanmar',
        },
        'draw'    => 20,
        'columns' => [ {
                'data'       => 'name',
                'searchable' => 1,
            },
            {
                'data'       => 'address',
                'searchable' => 1,
            },
            {
                'data'       => 'city',
                'searchable' => 1,
            },
            {
                'data'       => 'zip_code',
                'searchable' => 1,
            },
            {
                'data'       => 'country',
                'searchable' => 1,
            },
            {
                'data'       => 'phone',
                'searchable' => 1,
            },
            {
                'data'       => 'notes',
                'searchable' => 1,
            }
        ],

    };

    my $response = Controller::Customer::get_list($query_params);

    my $expected = {
        'recordsFiltered' => 1,
        'draw'            => 20,
        'data'            => [ {
                'sid'      => 2,
                'city'     => 'Myingyan',
                'address'  => '1566 Inegl Manor',
                'id'       => 4,
                'notes'    => 'active',
                'country'  => 'Myanmar',
                'zip_code' => '53561',
                'name'     => 'Barbara Jones',
                'phone'    => '705814003527'
            }
        ],
        'recordsTotal' => 10
    };

    is_deeply $response, $expected, "get_list() with filters";
}
$customer_module->unmock_all();

done_testing;
