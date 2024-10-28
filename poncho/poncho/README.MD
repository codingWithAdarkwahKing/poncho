# Poncho application

## Setup

The first thing to do is to clone the repository:

```sh
$ git clone git@gitlab.com:kingasare/poncho-portfolio.git
$ cd poncho
```

Create a virtual environment to install dependencies in and activate it:

```sh
$ virtualenv2 --no-site-packages env
$ source env/bin/activate
```

Then install the dependencies:

```sh
(env)$ pip install -r requirements.txt
```
Note the `(env)` in front of the prompt. This indicates that this terminal
session operates in a virtual environment set up by `virtualenv2`.

Once `pip` has finished downloading the dependencies:
```sh
(env)$ cd poncho
(env)$ python manage.py runserver
```
You can also cutomize the enviroment variables in a .env file to work with the content of the settings.py before 
running
```sh
(env)$ cd poncho
(env)$ python manage.py makemigrations
(env)$ python manage.py migrate
(env)$ python manage.py collectstatic
(env)$ python manage.py runserver
```
The command below will generate all the static files for the application in the static directory
```sh
(env)$ python manage.py collectstatic
```


And navigate to `http://127.0.0.1:8000`.

In order to test the application is up and running, fill in the account details in
`http://127.0.0.1:8000/api/accounts/login/` with the default credentials or signup with your own credentials.

## Walkthrough

Before you interact with the application, change you password and set up
the your account for high security. To make it work with this
application, use the Highly secured credentials. This is to
make sure you are interacting with the application safely and securly.

### One-off workout set up

The simplest creation of a workout plan is one-off. By clicking `create a new workout` on the
appliation website.

A real-world example of one-off workout is setting up a plan to workout in an online workout application.

## Tests

To run the tests, `cd` into the directory where `manage.py` is:
```sh
(env)$ python manage.py test
```
5 test cases should be handled