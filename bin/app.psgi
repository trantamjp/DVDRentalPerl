#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

use Plack::Builder;

# use this block if you don't need middleware, and only have a single target Dancer app to run here
use DVDRental;
use DVDRentalAPI;

builder {
    mount '/'    => DVDRental->to_app;
    mount '/api' => DVDRentalAPI->to_app;
};

#DVDRental->to_app;

=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use DVDRental;
use Plack::Builder;

builder {
    enable 'Deflater';
    DVDRental->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to mount several applications on different path

use DVDRental;
use DVDRental_admin;

use Plack::Builder;

builder {
    mount '/'      => DVDRental->to_app;
    mount '/admin'      => DVDRental_admin->to_app;
}

=end comment

=cut
