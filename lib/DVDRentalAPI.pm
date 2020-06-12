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

any [ 'get', 'post' ] => '/customers' => sub {

    my $body_parameters = body_parameters;
    my $args            = $body_parameters->get('args');

    return Controller::Customer::get_list($args);

};

any [ 'get', 'post' ] => '/films' => sub {

    my $body_parameters = body_parameters;
    my $args            = $body_parameters->get('args');

    return Controller::Film::get_list($args);

};

1;
