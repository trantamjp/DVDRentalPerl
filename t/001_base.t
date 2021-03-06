use strict;
use warnings;

use Test::More;
use_ok 'Controller::Customer';
use_ok 'Controller::Film';
use_ok 'DAO::DVDRental::Result::Actor';
use_ok 'DAO::DVDRental::Result::ActorInfo';
use_ok 'DAO::DVDRental::Result::Address';
use_ok 'DAO::DVDRental::Result::Category';
use_ok 'DAO::DVDRental::Result::City';
use_ok 'DAO::DVDRental::Result::Country';
use_ok 'DAO::DVDRental::Result::Customer';
use_ok 'DAO::DVDRental::Result::CustomerList';
use_ok 'DAO::DVDRental::Result::Film';
use_ok 'DAO::DVDRental::Result::FilmActor';
use_ok 'DAO::DVDRental::Result::FilmCategory';
use_ok 'DAO::DVDRental::Result::FilmList';
use_ok 'DAO::DVDRental::Result::Inventory';
use_ok 'DAO::DVDRental::Result::Language';
use_ok 'DAO::DVDRental::Result::NicerButSlowerFilmList';
use_ok 'DAO::DVDRental::Result::Payment';
use_ok 'DAO::DVDRental::Result::Rental';
use_ok 'DAO::DVDRental::Result::SaleByFilmCategory';
use_ok 'DAO::DVDRental::Result::SaleByStore';
use_ok 'DAO::DVDRental::Result::Staff';
use_ok 'DAO::DVDRental::Result::StaffList';
use_ok 'DAO::DVDRental::Result::Store';
use_ok 'DAO::DVDRental';
use_ok 'DVDRental';
use_ok 'DVDRentalAPI';

done_testing();
