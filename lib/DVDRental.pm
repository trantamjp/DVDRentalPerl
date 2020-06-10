package DVDRental;
use Dancer2 appname => 'DVDRental';

our $VERSION = '0.1';

use Dancer2::Plugin::DBIC;

set template => 'template_toolkit';

get '/' => sub {
    template 'index' => { 'title' => 'DVDRental' };
};

get '/customers' => sub {
    template
        'customers' => { 'title' => 'Customers' },
        { layout => 'main_dt' };
};

get '/films' => sub {
    template
        'films' => { 'title' => 'Films' },
        { layout => 'main_dt' };
};

1;
