package DVDRentalAPI;
use Dancer2 appname => 'DVDRentalAPI';

use strict;
use warnings;

use Controller::Customer;
use Controller::Film;

set serializer => 'Mutable';

get '/' => sub {
    return undef;
};

any ['post'] => '/customers' => sub {

    my $args = body_parameters;
    return Controller::Customer::get_list($args);

};

any ['post'] => '/films' => sub {

    my $args = body_parameters;
    return Controller::Film::get_list($args);

};

1;
