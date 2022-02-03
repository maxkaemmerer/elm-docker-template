module MainTests exposing (..)

import Browser exposing (UrlRequest(..))
import Expect
import Main exposing (Model, Msg(..), init, update)
import Routing exposing (Msg(..), NavKey(..), Page(..))
import Test exposing (..)
import Url exposing (Protocol(..), Url)


makeUrl : Url
makeUrl =
    Url Https "" (Just 80) "/my-path" Nothing Nothing


makeInitState : ( Model, Cmd Main.Msg )
makeInitState =
    init { key = LocalKey, page = Home }


makeInitModel : Model
makeInitModel =
    Tuple.first makeInitState


makeRoutingInitModel : Routing.Model
makeRoutingInitModel =
    (Tuple.first makeInitState).routing


makeInternalRequest : UrlRequest
makeInternalRequest =
    Internal makeUrl


makeExternalRequest : UrlRequest
makeExternalRequest =
    External "https://github.com"


all : Test
all =
    describe "update"
        [ test "ChangeRoute internal" <|
            \_ ->
                Expect.equal ( { makeInitModel | routing = { makeRoutingInitModel | page = NotFound } }, Cmd.none ) (update (RoutingMessage <| ChangeRoute makeInternalRequest) makeInitModel)
        , test "ChangeRoute external" <|
            \_ ->
                Expect.equal makeInitModel <| Tuple.first (update (RoutingMessage <| ChangeRoute makeExternalRequest) makeInitModel)
        , test "ChangedRoute" <|
            \_ ->
                Expect.equal ( { makeInitModel | routing = { makeRoutingInitModel | page = NotFound } }, Cmd.none ) (update (RoutingMessage <| ChangedRoute makeUrl) makeInitModel)
        ]
