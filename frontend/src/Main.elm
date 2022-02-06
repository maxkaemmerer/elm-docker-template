module Main exposing (..)

import Accessibility exposing (button, div, h1, p, text)
import Browser
import Browser.Events exposing (onKeyUp)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)
import Json.Decode as D


type alias Model =
    { title : String
    , counter : Int
    }


type Msg
    = Increment
    | Decrement
    | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | counter = model.counter + 1 }, Cmd.none )

        Decrement ->
            ( { model | counter = model.counter - 1 }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


init : ( Model, Cmd Msg )
init =
    ( { title = "Elm Example App"
      , counter = 0
      }
    , Cmd.none
    )


view : Model -> Browser.Document Msg
view model =
    { title = model.title
    , body =
        [ div [ class "uk-container uk-padding-remove@s" ]
            [ div [ class "uk-flex-row" ]
                [ h1 [ id "title", class "uk-heading-xlarge uk-text-center uk-margin-small-bottom uk-margin-small-top uk-padding-small-h@s" ] [ text model.title ]
                , div [ class "uk-flex-row" ]
                    [ div [ class "uk-section uk-section-muted uk-padding uk-padding-small@s" ]
                        [ div [ class "uk-card uk-card-default" ]
                            [ div [ class "uk-card-body" ]
                                [ p []
                                    [ text "Counter: "
                                    , String.fromInt model.counter |> text
                                    ]
                                ]
                            , div [ class "uk-card-footer" ]
                                [ button [ class "uk-button uk-button-primary uk-margin-right", onClick Increment ] [ text "+" ]
                                , button [ class "uk-button uk-button-danger", onClick Decrement ] [ text "-" ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    }


keyToMsg : String -> Msg
keyToMsg key =
    case key of
        "-" ->
            Decrement

        "+" ->
            Increment

        _ ->
            NoOp


subscriptions : Model -> Sub Msg
subscriptions model =
    onKeyUp (D.map keyToMsg (D.field "key" D.string))


main : Program () Model Msg
main =
    Browser.document
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = subscriptions
        }
