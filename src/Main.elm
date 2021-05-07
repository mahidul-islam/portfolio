module Main exposing (..)

import Browser
import Colors exposing (blue, white)
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
        column [ width <| px 960, centerX, spacing 50 ] [ navBar, body model, footer ]


navBar : Element Msg
navBar =
    row [ width fill, paddingEach { bottom = 0, left = 0, right = 0, top = 20 } ]
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
    column [ spacing 50 ] [ heroPart, bigText, experience, contactMe model ]


heroPart : Element Msg
heroPart =
    row [ width fill, spaceEvenly ]
        [ column
            [ height fill, spacing 50 ]
            [ text "Only Measuring Scale", text "Honesty and Truth" ]
        , column
            [ centerY
            , Border.widthEach { right = 1, left = 0, top = 0, bottom = 0 }
            , Border.color <| rgb255 0xE0 0xE0 0xE0
            , height <| px 200
            ]
            []
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
        [ column [ spacing 30 ]
            [ text "Hi, I am a Flutter dev, and a UX designer from Bangladesh."
            , text "With a strong passion for Knowledge and a very curious mind."
            ]
        ]


experience : Element Msg
experience =
    row []
        [ column [ spacing 30 ]
            [ text "My experience"
            , text "I have some experience in developing and prototyping beautiful app with a pinch of Backend Development"
            , row [ spacing 30 ]
                [ singleExperience "N-techBD" "Back End Developer" "July 2020 — August 2020"
                , singleExperience "Pillar" "Flutter Developer" "September 2020 — forever"
                ]
            ]
        ]


singleExperience : String -> String -> String -> Element Msg
singleExperience companyName role timeline =
    column [ spacing 20 ]
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
        [ column [ spacing 20 ]
            [ text "Want to get in touch?"
            , text "Drop me a line!"
            , text "I will be very happy to talk about any opportunity & possiblity"
            , row []
                [ nameForm model
                , emailForm model
                ]
            , messageForm model
            , sendButton model
            ]
        ]


nameForm : Model -> Element Msg
nameForm model =
    Input.text
        [ height shrink
        , spacing 12
        ]
        { text = model.name
        , placeholder = Just (Input.placeholder [] (text "Name"))
        , onChange = \new -> Update { model | name = new }
        , label = Input.labelAbove [ Font.size 14 ] (text "Name")
        }


emailForm : Model -> Element Msg
emailForm model =
    Input.text
        [ height shrink
        , spacing 12
        ]
        { text = model.email
        , placeholder = Just (Input.placeholder [] (text "E-mail"))
        , onChange = \new -> Update { model | email = new }
        , label = Input.labelAbove [ Font.size 14 ] (text "Email")
        }


messageForm : Model -> Element Msg
messageForm model =
    Input.multiline
        [ height shrink
        , spacing 12
        ]
        { text = model.message
        , placeholder = Just (Input.placeholder [] (text "message"))
        , onChange = \new -> Update { model | message = new }
        , label = Input.labelAbove [ Font.size 14 ] (text "Leave a message")
        , spellcheck = False
        }


sendButton : Model -> Element Msg
sendButton model =
    Input.button
        [ Background.color blue
        , Font.color white
        , paddingXY 32 16
        , Border.rounded 3
        , width fill
        ]
        { onPress = Nothing
        , label = Element.text "Send !!!"
        }


footer : Element Msg
footer =
    row [ width fill, paddingEach { bottom = 50, left = 0, right = 0, top = 0 } ]
        [ rightFooter
        , leftFooter
        ]


rightFooter : Element Msg
rightFooter =
    text "Get Me Everywhere"


leftFooter : Element Msg
leftFooter =
    row [ alignRight, spacing 20 ]
        [ link []
            { url = "http://github.com/mahidul-islam"
            , label = text "GitHub"
            }
        , link []
            { url = "https://www.linkedin.com/in/mahidul-islam-11309915a/"
            , label = text "LinkedIn"
            }
        , link []
            { url = "https://www.facebook.com/mizihan84/"
            , label = text "FaceBook"
            }
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
