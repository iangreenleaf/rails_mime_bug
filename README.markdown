# Rails Bug Repro Repo #

Reproduces [#18676](https://github.com/rails/rails/issues/18676).

```sh
$ rails s -p 3001

$ curl -I -H"Accept: application/json" http://localhost:3001/users #=> HTTP/1.1 200 OK 
$ curl -I -H"Accept: application/json, foo/bar" http://localhost:3001/users #=> HTTP/1.1 200 OK
$ curl -I -H"Accept: application/json, foo/*" http://localhost:3001/users #=> HTTP/1.1 200 OK 
$ curl -I -H"Accept: application/*, foo/bar" http://localhost:3001/users #=> HTTP/1.1 200 OK 
$ curl -I -H"Accept: */*" http://localhost:3001/users #=> HTTP/1.1 200 OK 
$ curl -I -H"Accept: application/json, */*" http://localhost:3001/users #=> HTTP/1.1 406 Not Acceptable 
```
