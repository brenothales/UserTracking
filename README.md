# User Tracking

Tool developed to monitor and track visits on a given site, built with Ruby on Rails is ideal, the tool helps you to know which products users have interests.

## Installation

Git clone the application:

```console
https://github.com/brenothales/UserTracking.
```

Change to application directory:

```console
cd UserTracking
```

Run the following command to install dependencies:

```console
bundle install
```

Create a development database:

```console
rake db:migrate RAILS_ENV=development
```

##Configuration

The solution comes with a config/application.yml file with a default configuration:


##Running the application

Boot WEBrick HTTP web server:

```console
rails server
```

Open a browser at the address:

```console
http://localhost:3000/
```
Click links 'Home' 'Contato' 'Sobre' at the navbar and finally click 'Relatório de Rastremaneto' to get the user's visit tracking report.

### Optional Execution of Sidekiq

If the application is configured to use Sidekiq you must start it with:

```console
bundle exec sidekiq
```

You can monitor the default queue at the address:

```console
http://localhost:3000/sidekiq
```

##Testing the application

Run the rspec command on the application folder:

```console
rspec
```
