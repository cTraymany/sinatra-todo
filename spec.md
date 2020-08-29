# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    <!-- Uses Sinatra to built http requests -->
- [x] Use ActiveRecord for storing information in a database
    <!-- Uses ActiveRecord to create tables -->
- [x] Include more than one model class (e.g. User, Post, Category)
    <!-- 1)User and 2)Task model -->
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    <!-- User has many tasks -->
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    <!-- Task belongs to user -->
- [x] Include user accounts with unique login attribute (username or email)
    <!-- Uses activerecord to validate login info and bcrypt to encrypt password -->
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    <!-- Options to POST, GET, PATCH, and DELETE tasks -->
- [x] Ensure that users can't modify content created by other users
    <!-- Uses conditions in forms to prevent editing others' task forms -->
- [x] Include user input validations
    <!-- Uses validate_presence_of and  validate_uniqueness_of methods -->
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
    <!-- At least 50 commits under 15 lines -->
- [x] Your commit messages are meaningful
    <!-- Descriptive commit messages -->
- [x] You made the changes in a commit that relate to the commit message
    <!-- Each commit describes actions taken -->
- [x] You don't include changes in a commit that aren't related to the commit message
    <!-- Each commit describes actions taken -->
