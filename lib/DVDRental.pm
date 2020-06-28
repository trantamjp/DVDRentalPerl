package DVDRental;
use Dancer2 appname => 'DVDRental';

our $VERSION = '0.1';

use Dancer2::Plugin::DBIC;

set template => 'template_toolkit';

get '/' => sub {
    my $newurl = URI->new(request->base);
    $newurl->port(80);
    redirect $newurl->canonical;
};

get '/home' => sub {
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
