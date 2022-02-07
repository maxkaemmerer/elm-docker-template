module Page.OtherPage exposing (view)

import Accessibility exposing (Html, decorativeImg, div, text)
import Html.Attributes exposing (src)


view : Html msg
view =
    div [] [ text "Other Page Content", decorativeImg [ src "/img/florian-olivo-4hbJ-eymZ1o-unsplash.webp" ] ]
