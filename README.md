mysite-erlang
=============

Redeploying my site, but this time written in erlang


Running Server
---

**First time:**

get dependencies, compile and run
```
$ rebar get-deps compile
$ erl -pa ebin deps/*/ebin -s mysite
```

**Following updates:**

compile and run
```
$ rebar compile
$ erl -pa ebin deps/*/ebin -s mysite
```

