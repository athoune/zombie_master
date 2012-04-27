-module(zm_app).

-behaviour(application).

%% Application callbacks
-export([start/0, start/2, stop/1]).

-define(PUBLIC, [<<"public">>]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start() ->
    application:start(zm).

start(_StartType, _StartArgs) ->
    Routes =
        [{'_', [
                    cowboy_static:rule([{dir, ?PUBLIC}, {prefix, [<<"static">>]}])
                ]}],
    cowboy:start_listener(http, 100,
        cowboy_tcp_transport, [{port, 4242}],
        cowboy_http_protocol, [{dispatch, Routes}]
    ),
    zm_sup:start_link().

stop(_State) ->
    ok.

