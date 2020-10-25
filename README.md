# TITLE

## Setting up Databases:

### Installing PostGreSQL:
- in Terminal, run:
```shell
% brew install postgres
```

### Setting Environment Variables:
- In Terminal, run:
```shell
% echo "export CHITTER_ENV='test'" \>> \~/.bash_profile
% source \~/.bash_profile
```

### Development Environment Database:
- In Terminal, run:
```shell
% psql
   \# CREATE DATABASE chitter_manager_\;
   \# \q
```
- Next, in Terminal run:
```shell
% psql chitter_manager -f 01_create_development_environment.sql
```

### Test Environment Database:
- In Terminal, run:
```shell
% psql
   \# CREATE DATABASE chitter_manager_test\;
   \# \q
```
- Next, in Terminal run:
```shell
% psql chitter_manager_test -f 02_create_test_environment.sql
```
