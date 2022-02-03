module Page.Home exposing (Model, init, view)

import Accessibility exposing (Html, div, text)


init : Model
init =
    { title = "My Website Test"
    , subtitle = "Some Author"
    , socialMediaLink = "https://twitter.com"
    }


type alias Model =
    { title : String
    , subtitle : String
    , socialMediaLink : String
    }


view : Html msg
view =
    div [] [ text "Some Content" ]
