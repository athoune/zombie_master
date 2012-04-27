-module(zm_token_test).

-include_lib("eunit/include/eunit.hrl").

split_test() ->
    ?assertEqual({<<"Bob">>, 42, <<"hash">>}, zm_token:split(<<"Bob:42:hash">>)).

validate_test() ->
    ?assertEqual({error, "Too early"}, zm_token:validate_int({<<"Bob">>, zm_token:clock() + 20, <<"hash">>}, 10, <<"Salt">>)),
    ?assertEqual({error, "Too late"}, zm_token:validate(<<"Bob:0:hash">>, 10, <<"Salt">>)).
