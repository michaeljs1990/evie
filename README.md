Evie
====

Generalized Glue for collins and genesis.

For running locally you can get off the ground quick for
development by running the following commands which will
get your environment all set up.

```
bundle install
export EVIE_CONFIG=`pwd`/evie/config/sites/general.yml
export PROFILE_CONFIG=`pwd`/evie/config/profiles/default.yml
bundle exec puma
```

## Bundle Install

You might need to install the following two packages on your system
in order to install puma... :(

```
apt install libssl-dev build-essentials
```
