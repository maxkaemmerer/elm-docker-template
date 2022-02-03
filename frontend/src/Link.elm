module Link exposing (Link, iconLink, link)

import Accessibility exposing (Html, a, span, text)
import Html.Attributes exposing (attribute, class, href, rel, target)


type alias Link =
    { title : String
    , href : String
    }


link : Link -> Html msg
link linkData =
    a [ class "uk-button uk-button-text uk-margin-medium-right uk-text-left", href linkData.href, target "_blank", rel "noreferrer" ] [ text linkData.title ]


iconLink : String -> Link -> Html msg
iconLink icon linkData =
    a [ class "uk-button uk-button-text uk-margin-small-right uk-text-left", href linkData.href, target "_blank", rel "noreferrer" ]
        [ span [ attribute "uk-icon" icon, class "uk-margin-small-right" ] []
        , text linkData.title
        ]
