# README

Backend/API that powers Txttide App

Prerequisits:
 * Homebrew
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
 
 * RVM (http://rvm.io)

 * Ruby version: ruby 2.5.3

 * nvm
 curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

 * Node.js (Install via nvm)
 
 * Yarn
 brew install yarn --ignore-dependencies
 
 * Install Dependencies:
  1. Postgresql & PostGISs
  2. Imagemagick
  3. Git (it's already on a Mac, but the Homebrew version is more up to date)
  4. XCode command line tools
  
  brew install postgresql
  brew install postgis
  brew install imagemagick
  brew install git
  xcode-select --install
  
  * Clone txt-backend-rails git directory and cd to it:
 
  * Install the dependencies specified in Gemfile:
  bundle install
  
  * Database creation
  rails db:create
  
  * Database initialization
  rails db:migrate
  
  * Start the system:
  rails s

