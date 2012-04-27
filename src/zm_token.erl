-module(zm_token).

-export([validate/3]).

-ifdef(TEST).
-export([split/1]).
-endif.

split(Token) ->
    [Id, Timestamp, Signature] = binary:split(Token, <<":">>, [global]),
    {Id, list_to_integer(binary_to_list(Timestamp)), Signature}.

validate(Token, MaxAge, Salt) ->
    validate_int(split(Token), MaxAge, Salt).

clock() ->
    {MegaSecs, Secs, _MicroSecs} = now(),
    MegaSecs * 1000 + Secs.

hashmac(Key, Salt) ->
    crypto:sha_mac(Key, Salt).


validate_int({Id, Timestamp, Signature}, MaxAge, Salt) ->
    Now = clock(),
    if
        Timestamp > Now -> {error, "Too early"};
        Timestamp + MaxAge < Now -> {error, "Too late"};
        true ->
            case hashmac([Id, Timestamp], Salt) of Signature -> ok;
                _ -> {error, "Bad signature"}
            end
    end.
