# User Tracking

Tool developed to monitor and track visits on a given site, built with Ruby on Rails is ideal, the tool helps you to know which products users have interests.

## Installation

Git clone the application:

```console
https://github.com/brenothales/UserTracking
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

##Testing the application

Run the rspec command on the application folder:

```console
rspec
```
## Screenshot
![alt tag](https://github.com/brenothales/UserTracking/blob/master/app/assets/images/1.png?raw=true)

![alt tag](https://github.com/brenothales/UserTracking/blob/master/app/assets/images/2.png?raw=true)

![alt tag](https://github.com/brenothales/UserTracking/blob/master/app/assets/images/3.png?raw=true)

![alt tag](https://github.com/brenothales/UserTracking/blob/master/app/assets/images/4.png?raw=true)
### Considerations
At first I had a lot of difficulties to start, but a few hours of research I think I got the relatively expected result
