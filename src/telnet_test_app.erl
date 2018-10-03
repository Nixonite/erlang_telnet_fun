%%%-------------------------------------------------------------------
%% @doc telnet_test public API
%% @end
%%%-------------------------------------------------------------------

-module(telnet_test_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    {ok, _} = ranch:start_listener(tcp_echo, 100,
        ranch_tcp, [{port, 5555}], echo_protocol, []),
    telnet_test_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.