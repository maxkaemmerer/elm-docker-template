module MainTests exposing (..)

import Expect
import Main exposing (Msg(..), init, update)
import Test exposing (..)


all : Test
all =
    describe "update"
        [ test "Increment" <|
            \_ ->
                Expect.equal ( { title = "Elm Example App", counter = 1 }, Cmd.none ) (Tuple.first init |> update Increment)
        , test "Decrement" <|
            \_ ->
                Expect.equal ( { title = "Elm Example App", counter = -1 }, Cmd.none ) (Tuple.first init |> update Decrement)
        ]
