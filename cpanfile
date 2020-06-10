requires "DBD::Pg"               => "0";
requires "DBIx::Class"           => "0.082841";
requires "Dancer2"               => "0.300004";
requires "Dancer2::Plugin::DBIC" => "0";
requires "Plack::Builder"        => "0";

on "test" => sub {
    requires "HTTP::Request::Common" => "0";
    requires "Hash::MultiValue"      => "0";
    requires "Plack::Test"           => "0";
    requires "Ref::Util"             => "0";
    requires "Test::DBIx::Class"     => "0";
    requires "Test::MockModule"      => "0";
    requires "Test::More"            => "0";
};
