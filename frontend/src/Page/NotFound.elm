module Page.NotFound exposing (view)

import Accessibility exposing (Html, div, h3, text)


view : Html msg
view =
    div [] [ h3 [] [ text "This page does not exist. ¯\\_(ツ)_/¯" ] ]
