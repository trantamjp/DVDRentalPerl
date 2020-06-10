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

get '/customers' => sub {

    my $query_params = query_parameters;
    return Controller::Customer::get_list($query_params);

};

get '/films' => sub {

    my $query_params = query_parameters;
    return Controller::Film::get_list($query_params);

};

1;
