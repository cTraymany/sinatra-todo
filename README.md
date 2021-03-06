# Sinatra Todo Web App

This Sinatra web app allows multiple users to create todo lists. Safely create an account to keep track of your chores! We use BCrypt to encrypt user passwords. Take note of important details with the option to add a description to each task! Tasks are stored in a database created with SQLite3.


## Getting Started
### Prerequisites
This app is run with Ruby. Please have Ruby installed before beginning.

Fork and clone this repository onto your terminal.

### Installing
    $ git clone git@github.com:cTraymany/sinatra-todo.git
    $ bundle install
    $ rake db:migrate
    $ shotgun

    Navigate to http://localhost:9393/ in your browser.
    
    When you are finished, don't forget to enter `CTRL+C` in your terminal to exit Shotgun!

### Built With
[VS Code](https://code.visualstudio.com/) - text editor

### Contributing
See CONTRIBUTING.md for details on code of conduct.

### Authors
Chindalath Traymany - cTraymany

### License
This project is licensed under the MIT License - see the LICENSE.md file for details

### Acknowledgments
Special thanks to [Corneal Gem](https://thebrianemory.github.io/corneal/) for providing the skeleton to this app.
