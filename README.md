Evie
====

Generalized Glue for collins and genesis.

For running locally you can get off the ground quick for
development by running the following commands which will
get your environment all set up.

```
bundle install
export EVIE_CONFIG=`pwd`/config/sites/general.yml
export PROFILE_CONFIG=`pwd`/config/profiles/default.yml
bundle exec puma
```

## Bundle Install

You might need to install the following two packages on your system
in order to install puma... :(

```
apt install libssl-dev build-essentials
```

## Prime Public Folder

To setup the public folder you will need the following files. You can build
the image from the tumblr/genesis repo and the stage2.rb and config.yml
can me found in michalejs1990/genesis-tasks config.yml is the collins.yml
file in that folder and stage2.rb is the stage2/init.rb file. The repo
has directions for how to make the tasks.tgz file.

```
./genesis/image/genesis-initrd.img
./genesis/image/genesis-vmlinuz
./genesis/stage2.rb
./genesis/config.yml
./genesis/tasks.tgz
```
