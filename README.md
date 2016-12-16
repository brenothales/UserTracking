# User Tracking

Tool developed to monitor and track visits to a particular site, built with Ruby on Rails, the tool helps you to know which products, pages, time and date users access and have more interests. Heroku has been deployed in the Front-end and Back-end.

## Installation

Git clone the application:

```console
git clone https://github.com/brenothales/UserTracking.git
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


```console
bundle exec sidekiq
```

##Testing the application

Run the rspec command on the application folder:

```console
rspec
```
#Front-end

Front-end is a simple website, according to the parameters of the W3C, while the visitor is web-surfing the sessions of cookies is being recorded and sent to the server. To know the tool click the https://landpages.herokuapp.com/

## Screenshot
![alt tag](https://github.com/brenothales/UserTracking/blob/master/app/assets/images/1.png?raw=true)

![alt tag](https://github.com/brenothales/UserTracking/blob/master/app/assets/images/3.png?raw=true)

![alt tag](https://github.com/brenothales/UserTracking/blob/master/app/assets/images/4.png?raw=true)

#Back-end

Back-end é todo desenvolvido em Ruby on Rails e você pode acessa pelo link  https://landpages.herokuapp.com/rastreamentos

![alt tag](https://github.com/brenothales/UserTracking/blob/master/app/assets/images/2.png?raw=true)
### Considerations
At first I had a lot of difficulties to start, but a few hours of research I think I got the relatively expected result
