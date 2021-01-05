# Rails Project Template

Clone this repository for a base rails install according to my personal preferences at the moment.

## Install

After cloning the repo, do a find-all for the keyword `@changeme` and change
any names or blocks as described beneath its location.

## Usage

### Dependencies

1. `$ brew install asdf`    # install asdf package manager
2. `$ asfd install`         # install depedencies (ruby, node, yarn, etc)
3. `$ bundle install`       # install ruby gems
4. `$ yarn install`         # install npm modules
5. `$ docker-compose start` # start redis & postgres
6. `$ rails db:create`      # create database
7. `$ rails db:migrate`     # migrate schema
8. `$ rails db:seed`        # seed if needed

### Secret Keys ###
For each env `development`, `staging`, `production`:

1. Run `$ rails secret`
2. Create an AWS secret key pair for your dev, staging, and prod environments
3. Create an assets s3 bucket for your dev, staging, and prod environments
4. Run `$ RAILS_ENV=<current env> rails c` and then `> Lockbox.generate_key`
5. Run `EDITOR="atom --wait" rails credentials:edit --environment <current env>` # swap out editor with yours if needed
6. Fill out the following and replace the contents of the file
  ```yml
  secret_key_base: <rails secret from step 1>

  aws:
    access_key_id: <aws key from step 2>
    secret_access_key: <aws key from step 2>
    assets_bucket: <s3 bucket name from step 3>

  lockbox:
    master_key: <lockbox key from step 4>
  ```

### Development

Start in development mode with hot-reloading via websockets
`$ foreman start -f Procfile.dev`

### Production
`$ docker build -t thatsprettyneat-org/neature-walk .`

#### Web
`$ docker run -p 80:3000 -env="RAILS_ENV=production" thatsprettyneat-org/neature-walk bundle exec rails server`

#### Worker
`$ docker run -env="RAILS_ENV=production" thatsprettyneat-org/neature-walk bundle exec sidekiq`
