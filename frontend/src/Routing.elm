module Routing exposing (Model, Msg(..), NavKey(..), Page(..), init, update)

import Browser exposing (UrlRequest(..))
import Browser.Navigation as Nav
import Url exposing (Url)


init : Url -> Nav.Key -> Model
init url key =
    { key = Key key, page = pathToPage url.path }


type Msg
    = ChangeRoute UrlRequest
    | ChangedRoute Url


type alias Model =
    { page : Page
    , key : NavKey
    }


type Page
    = Home
    | OtherPage
    | NotFound


type NavKey
    = Key Nav.Key
    | LocalKey


pathToPage : String -> Page
pathToPage path =
    case path of
        "/" ->
            Home

        "/other-page" ->
            OtherPage

        _ ->
            NotFound


pushUrl : NavKey -> String -> Cmd msg
pushUrl key url =
    case key of
        Key navKey ->
            Nav.pushUrl navKey url

        LocalKey ->
            Cmd.none


type alias RouteAwareModel m =
    { m | routing : Model }


update : Msg -> RouteAwareModel m -> ( RouteAwareModel m, Cmd msg )
update msg model =
    let
        routing =
            model.routing
    in
    case msg of
        ChangeRoute request ->
            case request of
                Internal url ->
                    ( { model | routing = { routing | page = pathToPage url.path } }, pushUrl routing.key url.path )

                External href ->
                    ( model, Nav.load href )

        ChangedRoute url ->
            ( { model | routing = { routing | page = pathToPage url.path } }, Cmd.none )
