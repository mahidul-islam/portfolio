module Main exposing (..)

import Browser exposing (element)
import Colors
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Html exposing (Html)



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



-- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    layout [ Background.tiled "double-bubble-outline.png" ] <|
        column [ width <| px 960, centerX ] [ navBar, body, footer ]


navBar : Element msg
navBar =
    row [ width fill ]
        [ rightNav
        , leftNav
        ]


rightNav : Element msg
rightNav =
    image []
        { src = "first_logo.png"
        , description = "Logo"
        }


leftNav : Element msg
leftNav =
    row [ alignRight ] [ text "Home", text "About" ]


body : Element msg
body =
    column [] [ heroPart, bigText, experience, contactMe ]


heroPart : Element msg
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


bigText : Element msg
bigText =
    row []
        [ column []
            [ text "Hi, I am a Flutter dev, and a UX designer from Bangladesh."
            , text "With a strong passion for Knowledge and a very curious mind."
            ]
        ]


experience : Element msg
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


singleExperience : String -> String -> String -> Element msg
singleExperience companyName role timeline =
    column []
        [ text companyName
        , text role
        , text timeline
        ]


contactMe : Element msg
contactMe =
    row
        [ Background.color Colors.paleGrey
        , width fill
        , height <| px 200
        ]
        [ column []
            [ text "Want to get in touch?"
            , text "Drop me a line!"
            , text "I will be very happy to talk about any opportunity & possiblity"
            , row []
                [--     form "NAME"
                 -- , form "EMAIL ADDRESS"
                ]
            ]
        ]



-- form : String -> Element msg
-- form title =
--     Input.multiline
--         [ width <| maximum 450 fill
--         , height <| px 150
--         , Border.rounded 6
--         , Border.width 2
--         , Border.color <| rgb255 0x72 0x9F 0xCF
--         ]
--         { onChange = msg
--         , text = ""
--         , placeholder = Just <| Input.placeholder [] <| text "Type your message"
--         , label = Input.labelAbove [] <| text "Message"
--         , spellcheck = True
--         }
-- change input =
--     msg


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
