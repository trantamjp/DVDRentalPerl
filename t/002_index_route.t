use strict;
use warnings;

use DVDRental;
use DVDRentalAPI;

use Test::More;
use Plack::Test;
use HTTP::Request::Common;
use Ref::Util qw<is_coderef>;

subtest 'DVDRental index' => sub {

    my $app = DVDRental->to_app;
    ok(is_coderef($app), 'Got app');

    DVDRental::set log => 'debug';
    my $test = Plack::Test->create($app);
    my $res  = $test->request(GET '/');

    ok($res->is_success, '[GET /] successful');
};

subtest 'DVDRentalAPI index' => sub {
    my $app = DVDRentalAPI->to_app;
    ok(is_coderef($app), 'Got app');

    DVDRentalAPI::set log => 'debug';
    my $test = Plack::Test->create($app);
    my $res  = $test->request(GET '/');

    ok($res->is_success, '[GET /] successful');
};

done_testing;
