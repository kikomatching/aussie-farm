# Aussie Farm Dashboard
Developed by Francis Emmanuel Galguerra

## System Requirements

- PHP 7.2
- MariaDB 10

## Installation Instructions

1. Run `composer install`
2. Then, `php artisan migrate` to generate the database tables.
3. To seed temporary data, run `php artisan db:seed`

If seeding did not work, you can manually import the aussie_farm.sql found at the root directory of the repository.