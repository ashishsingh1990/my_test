<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 -->

Ruby version
 - 2.4.0
 
Rails version
 - 5.1.5

Download or clone Project from Github

- HTTP https://github.com/ashishsingh1990/ashish_homify.git 
- SSH  git@github.com:ashishsingh1990/ashish_homify.git

Download Project from github and goto project directory follow some step for configure your project on local or remote machine.

Step-1 If you are using postgresql database go to Gemfile uncomment gem 'pg' and run bundle command in console. Please create database.yml in config directory add postgresql socket in config/database.yml which is given below 
Note: Database username and password you will have to changes in config/application.yml. application.yml not exits in project you have to create manually.

--------------------------------postgresql---------------------------

development:
  adapter: postgresql
  encoding: unicode
  username: <%= ENV['Username'] %>
  password: <%= ENV['Password'] %>
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  database: dd_development

test:
  adapter: postgresql
  encoding: unicode
  username: <%= ENV['Username'] %>
  password: <%= ENV['Password'] %>
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  database: dd_test

production:
  adapter: postgresql
  encoding: unicode
  username: <%= ENV['Username'] %>
  password: <%= ENV['Password'] %>
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  database: dd_production
  username: dd
  password: <%= ENV['DD_DATABASE_PASSWORD'] %>
  
-----------------------------------------end-------------------------------

Step-2 If you are using Mysql database in Gemfile mysql2 gem already added and go to rails console run bundle command in console. Please create database.yml in project -> config directory add mysql socket in config/database.yml which is given below 
Note: Database username and password you will have to changes in application.yml. application.yml not exits in project you have to create manually.

---------------------------------mysql-------------------------------------

development:
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV['Username'] %>
  password: <%= ENV['Password'] %>
  socket: /var/run/mysqld/mysqld.sock
  database: homify_test_development

test:
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV['Username'] %>
  password: <%= ENV['Password'] %>
  socket: /var/run/mysqld/mysqld.sock
  database: homify_test_test

production:
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV['Username'] %>
  password: <%= ENV['Password'] %>
  socket: /var/run/mysqld/mysqld.sock
  database: homify_test_production
  username: homify_test
  password: <%= ENV['HOMIFY_TEST_DATABASE_PASSWORD'] %>

----------------------------end--------------------------------------------------

Note: You will have to create config/application.yml


Step- 3  Run command

- rake db:create 
- rake db:migrate
- rake db:seed

When you will run rak db:seed command. Default two user will be created.


First User- ashish --- Role is expert -- 
- Ashish has full access rights. He can create, update and delete campaign, todo. He can change the status of users. He can also comments on campaign and todo.

Second User- naveen --- Role is novice
- Naveen can create and edit Todo but can not delete. Delete permission only have expert user. Even naveen can't create campaign. He can create only Todo. He can comment only todos because he has not permission to comment campaigns and todos which is created by "expert" (expert is user's role).

Step - 4
  rails server

Please visit on heroku
- https://homify-ashish.herokuapp.com/
