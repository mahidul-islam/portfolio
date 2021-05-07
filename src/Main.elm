module Main exposing (..)

import Browser
import Colors
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)



---- MODEL ----


type alias Model =
    { name : String
    , email : String
    , message : String
    }


type Msg
    = Update Model


init : ( Model, Cmd Msg )
init =
    ( { name = ""
      , email = ""
      , message = ""
      }
    , Cmd.none
    )



-- UPDATE ----
-- type Msg
--     = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    layout [ Background.tiled "double-bubble-outline.png" ] <|
        column [ width <| px 960, centerX ] [ navBar, body model, footer ]


navBar : Element Msg
navBar =
    row [ width fill ]
        [ rightNav
        , leftNav
        ]


rightNav : Element Msg
rightNav =
    image []
        { src = "first_logo.png"
        , description = "Logo"
        }


leftNav : Element Msg
leftNav =
    row [ alignRight ] [ text "Home", text "About" ]


body : Model -> Element Msg
body model =
    column [] [ heroPart, bigText, experience, contactMe model ]


heroPart : Element Msg
heroPart =
    row []
        [ column
            [ width fill
            , centerY
            , spacing 10
            , Border.widthEach { right = 1, left = 0, top = 0, bottom = 0 }
            , Border.color <| rgb255 0xE0 0xE0 0xE0
            , height <| px 200
            ]
            [ text "Only Measuring Scale", text "Honesty and Truth" ]
        , column []
            [ image []
                { src = "rotating_clock.gif"
                , description = "An image"
                }
            ]
        ]


bigText : Element Msg
bigText =
    row []
        [ column []
            [ text "Hi, I am a Flutter dev, and a UX designer from Bangladesh."
            , text "With a strong passion for Knowledge and a very curious mind."
            ]
        ]


experience : Element Msg
experience =
    row []
        [ column []
            [ text "My experience"
            , text "I have some experience in developing and prototyping beautiful app with a pinch of Backend Development"
            , row []
                [ singleExperience "N-techBD" "Back End Developer" "July 2020 — August 2020"
                , singleExperience "Pillar" "Flutter Developer" "September 2020 — forever"
                ]
            ]
        ]


singleExperience : String -> String -> String -> Element Msg
singleExperience companyName role timeline =
    column []
        [ text companyName
        , text role
        , text timeline
        ]


contactMe : Model -> Element Msg
contactMe model =
    row
        [ Background.color Colors.paleGrey
        , width fill
        , height <| px 400
        ]
        [ column []
            [ text "Want to get in touch?"
            , text "Drop me a line!"
            , text "I will be very happy to talk about any opportunity & possiblity"
            , row []
                [ form model
                , form model
                ]
            , form model
            ]
        ]


form : Model -> Element Msg
form model =
    Input.multiline
        [ height shrink
        , spacing 12

        -- , padding 6
        ]
        { text = "Hello"
        , placeholder = Just (Input.placeholder [] (text "Extra hot sauce?\n\n\nYes pls"))
        , onChange = \new -> Update { model | message = new }
        , label = Input.labelAbove [ Font.size 14 ] (text "Leave a comment!")
        , spellcheck = False
        }


footer : Element msg
footer =
    row [] [ text "footer" ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
