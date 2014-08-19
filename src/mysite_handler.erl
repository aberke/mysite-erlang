-module(mysite_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

init(_Transport, Req, []) ->
	io:format("mysite_handler:init(~w, Req)~n~n", [_Transport]),
	{ok, Req, undefined}.

handle(Req, State) ->
	io:format("mysite_handler:handle(Req, ~w)~n~n", [State]),
	{ok, Req2} = cowboy_req:reply(200, [], <<"Hello world!">>, Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	io:format("mysite_handler:terminate(~w, _Req, ~w)~n~n", [_Reason, _State]),
	ok.

