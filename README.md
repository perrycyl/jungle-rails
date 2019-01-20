# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. 

Features coded:
- Admin login and ability for admin to add new categories. New categories are available as option to new products added.
- Added user login along with success/failed login and redirection.
- Setup user registration.
- Added product review and rating section.
- Added database tables and validations for ratings and users.


## Final Product

![First Screenshot](https://i.imgur.com/5rd0ojF.jpg "Landing Page")
![Second Screenshot](https://i.imgur.com/zDadDDG.jpg "Product Page")

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset`
6. Run `bin/rake db:migrate` 
7. Create .env file based on .env.example
8. Sign up for a Stripe account
9. Put Stripe (test) keys into appropriate .env vars
10. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Sass 5.0
* Bcrypt 3.1
* Puma
* Font-Awesome
* Money-rails
* Carrierwave
* RMagic
* Faker
