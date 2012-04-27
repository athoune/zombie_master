-module(zm_token_test).

-include_lib("eunit/include/eunit.hrl").

split_test() ->
    ?assertEqual({<<"Bob">>, 42, <<"hash">>}, zm_token:split(<<"Bob:42:hash">>)).
