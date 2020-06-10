# DVDRentalPerl

Sample Perl

## Preparing database

Download sample data from https://www.postgresqltutorial.com/postgresql-sample-database/

## Installation

```
  git clone https://github.com/trantamjp/DVDRentalPerl.git
  cd DVDRentalPerl
  # use perlbrew needed
  # perlbrew list
  # perlbrew use perl-5-18.4
  
  cpanm -l local --installdeps .
  # Or (take longer) cpanm -L local --installdeps .
```

  Modify `environments/development.yml` as needed.
  Change `DBIC` plugin DSN to the database imported above

## Run

```
  plackup bin/app.psgi
```
Goto http://localhost:5000/
