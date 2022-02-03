module Main exposing (..)

import Accessibility exposing (div)
import Browser exposing (UrlRequest(..))
import Html as Html exposing (a, h1, h2, span, text)
import Html.Attributes exposing (class, href, id)
import Navigation
import Page.Home as Home
import Page.NotFound as NotFound
import Page.OtherPage as OtherPage
import Routing exposing (Page(..))


type alias Model =
    { home : Home.Model
    , routing : Routing.Model
    }


type Msg
    = RoutingMessage Routing.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RoutingMessage routingMessage ->
            Routing.update routingMessage model


init : Routing.Model -> ( Model, Cmd Msg )
init routingModel =
    ( { routing = routingModel
      , home = Home.init
      }
    , Cmd.none
    )


view : Model -> Browser.Document Msg
view model =
    let
        page =
            case model.routing.page of
                Home ->
                    Home.view

                NotFound ->
                    NotFound.view

                OtherPage ->
                    OtherPage.view
    in
    { title = model.home.title
    , body =
        [ div [ class "uk-container uk-padding-remove@s" ]
            [ div [ class "uk-flex-row" ]
                [ h1 [ id "title", class "uk-heading-xlarge uk-text-center uk-margin-small-bottom uk-margin-small-top uk-padding-small-h@s" ] [ text model.home.title ]
                , h2 [ class "uk-heading-line uk-text-center uk-margin-remove-top uk-margin-small-bottom uk-padding-small-h@s" ] [ span [] [ text "is ", a [ class "uk-link-heading", href model.home.socialMediaLink ] [ text model.home.subtitle ] ] ]
                , Navigation.view model.routing.page
                , div [ class "uk-flex-row" ]
                    [ div [ class "uk-section uk-section-muted uk-padding uk-padding-small@s" ] [ page ] ]
                ]
            ]
        ]
    }


main : Program () Model Msg
main =
    Browser.application
        { view = view
        , init = \_ url key -> Routing.init url key |> init
        , update = update
        , subscriptions = always Sub.none
        , onUrlRequest = RoutingMessage << Routing.ChangeRoute
        , onUrlChange = RoutingMessage << Routing.ChangedRoute
        }
