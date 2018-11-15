# RVM - Ruby version manager
It is command-line tool helps to install, manage different ruby environments.

#### Install RVM
```sh
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

$ \curl -sSL https://get.rvm.io | bash -s stable
```
#### Update RVM 
``` 
rvm get stable
```
#### List of installed Ruby list
``` 
$ rvm list         # List rubies only
$ rvm list gemsets # List rubies and gemsets
$ rvm gemset list  # List gemsets for current ruby
```
#### Install Ruby
```
$ rvm install 1.9.3                # Latest known patch level
$ rvm install 1.9.3 -j 3           # Parallel compile, set to # of CPU cores
$ rvm install 1.9.3 --patch falcon # Use a patch (falcon for performance)
$ rvm install 1.9.2-p318           # Patchlevel 318
```
#### Selecting Ruby for work
```
$ rvm system            # For system ruby, with fallback to default 
$ rvm use jruby         # For current session only
$ rvm use --default 1.9.3    # For current and new sessions
```