use strict;
use warnings;

use Test::More;

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

ok my $customer_first = CustomerList->single({ id => 1 }) => 'First customer';

is_fields $customer_first,
    {
    'zip_code' => '35200',
    'city'     => 'Sasebo',
    'id'       => 1,
    'address'  => '1913 Hanoi Way',
    'phone'    => '28303384290',
    'notes'    => 'active',
    'sid'      => 1,
    'name'     => 'Mary Smith',
    'country'  => 'Japan',
    },
    'First customer has the expected fields';

my $customers = [
    map {
        { $_->get_columns }
    } CustomerList->all() ];
my $expected = [ {
        'country'  => 'Japan',
        'notes'    => 'active',
        'phone'    => '28303384290',
        'sid'      => 1,
        'id'       => 1,
        'zip_code' => '35200',
        'city'     => 'Sasebo',
        'address'  => '1913 Hanoi Way',
        'name'     => 'Mary Smith'
    },
    {
        'phone'    => '838635286649',
        'notes'    => 'active',
        'country'  => 'United States',
        'sid'      => 1,
        'id'       => 2,
        'zip_code' => '17886',
        'name'     => 'Patricia Johnson',
        'city'     => 'San Bernardino',
        'address'  => '1121 Loja Avenue'
    },
    {
        'sid'      => 1,
        'id'       => 3,
        'notes'    => 'active',
        'country'  => 'Greece',
        'phone'    => '448477190408',
        'city'     => 'Athenai',
        'address'  => '692 Joliet Street',
        'name'     => 'Linda Williams',
        'zip_code' => '83579'
    },
    {
        'name'     => 'Barbara Jones',
        'city'     => 'Myingyan',
        'address'  => '1566 Inegl Manor',
        'zip_code' => '53561',
        'sid'      => 2,
        'id'       => 4,
        'phone'    => '705814003527',
        'notes'    => 'active',
        'country'  => 'Myanmar'
    },
    {
        'notes'    => 'active',
        'country'  => 'Taiwan',
        'phone'    => '10655648674',
        'sid'      => 1,
        'id'       => 5,
        'zip_code' => '42399',
        'address'  => '53 Idfu Parkway',
        'city'     => 'Nantou',
        'name'     => 'Elizabeth Brown'
    },
    {
        'sid'      => 2,
        'id'       => 6,
        'country'  => 'United States',
        'notes'    => 'active',
        'phone'    => '860452626434',
        'city'     => 'Laredo',
        'address'  => '1795 Santiago de Compostela Way',
        'name'     => 'Jennifer Davis',
        'zip_code' => '18743'
    },
    {
        'sid'      => 1,
        'id'       => 7,
        'notes'    => 'active',
        'country'  => 'Yugoslavia',
        'phone'    => '716571220373',
        'city'     => 'Kragujevac',
        'address'  => '900 Santiago de Compostela Parkway',
        'name'     => 'Maria Miller',
        'zip_code' => '93896'
    },
    {
        'notes'    => 'active',
        'country'  => 'New Zealand',
        'phone'    => '657282285970',
        'id'       => 8,
        'sid'      => 2,
        'zip_code' => '77948',
        'address'  => '478 Joliet Way',
        'city'     => 'Hamilton',
        'name'     => 'Susan Wilson'
    },
    {
        'sid'      => 2,
        'id'       => 9,
        'notes'    => 'active',
        'country'  => 'Oman',
        'phone'    => '380657522649',
        'address'  => '613 Korolev Drive',
        'city'     => 'Masqat',
        'name'     => 'Margaret Moore',
        'zip_code' => '45844'
    },
    {
        'phone'    => '648856936185',
        'notes'    => 'active',
        'country'  => 'Iran',
        'id'       => 10,
        'sid'      => 1,
        'zip_code' => '53628',
        'name'     => 'Dorothy Taylor',
        'address'  => '1531 Sal Drive',
        'city'     => 'Esfahan'
    } ];
is_deeply $customers, $expected, "All customers";

done_testing;
