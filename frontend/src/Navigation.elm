module Navigation exposing (view)

import Accessibility exposing (Html, a, div, li, nav, text, u, ul)
import Html.Attributes exposing (attribute, class, classList, href)
import Routing exposing (Page(..))


view : Page -> Html msg
view activePage =
    let
        pages =
            [ ( Home, "/", "Home" )
            , ( OtherPage, "/other-page", "OtherPage" )
            ]
    in
    nav [ class "uk-navbar-container uk-navbar-transparent", attribute "uk-navbar" "" ]
        [ div [ class "uk-navbar uk-navbar-center" ]
            [ ul [ class "uk-navbar-nav" ] <|
                List.map (renderNavItem activePage) pages
            ]
        ]


renderNavItem : Page -> ( Page, String, String ) -> Html msg
renderNavItem activePage ( page, link, label ) =
    let
        isActive =
            page == activePage
    in
    li [ classList [ ( "uk-active uk-heading", isActive ) ] ]
        [ a [ class "uk-text-secondary uk-link-primary", classList [ ( "uk-text-bold", isActive ) ], href link ]
            [ if isActive then
                u [] [ text label ]

              else
                text label
            ]
        ]
