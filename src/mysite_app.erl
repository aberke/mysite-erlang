-module(mysite_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

-define(C_ACCEPTORS,  100).

%% ===================================================================
%% Application callbacks
%% ===================================================================


start(_StartType, _StartArgs) ->	
	io:format("*****mysite_app:start(~w, ~w)*****~n", [_StartType, _StartArgs]),
    Routes 		= routes(),
    Dispatch 	= cowboy_router:compile(Routes),
    Port 		= port(),
    TransOpts 	= [{port, Port}],
    ProtoOpts 	= [{env, [{dispatch, Dispatch}]}],
    {ok, _} 	= cowboy:start_http(http, ?C_ACCEPTORS, TransOpts, ProtoOpts),
    mysite_sup:start_link().

stop(_State) ->
    ok.


%% =======================================================================
%% Internal functions
%% =======================================================================
routes() ->
	[
		{'_', [
			{"/", cowboy_static, {file, "static/html/index.html"}},
			{"/static/[...]", cowboy_static, {dir, "static"}},
			{"/hello", mysite_handler, []}
		]}
	].

port() ->
	case os:getenv("PORT") of
		false ->
			{ok, Port} = application:get_env(http_port),
			Port;
		Other ->
			list_to_integer(Other)
	end.










