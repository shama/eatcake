# Eat Cake

A convenient way to install CakePHP with Composer.

## One Line Install

* `curl https://raw.github.com/shama/eatcake/master/bin/oneline.sh | bash -s NewCakeApp`

## Manual Install

* Install [Composer](http://getcomposer.org/)
* Run the command: `php composer.phar create-project shama/eatcake path/`

## Updating

* Update CakePHP later with: `php composer.phar update` from inside your project directory.

## What?

Using Composer, this will download CakePHP and set it up. The CakePHP core will
be located in the `vendor/cakephp/cakephp/lib/Cake` folder. The included
`index.php` file wil set the `CAKE_CORE_INCLUDE_PATH` to that folder.

This uses the official CakePHP repository (look in the composer.json).

## Who?

Brought to you by [chicken shawarma!](http://twitter.com/shamakry)
