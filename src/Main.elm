module Main exposing (..)

import Browser
import Colors exposing (apple, blue, charcoalGrey, dark, neonRed, paleGrey, white)
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
    layout
        [ Background.tiled "double-bubble-outline.png"
        , Font.family
            [ Font.external
                { name = "Montserrat"
                , url = "https://fonts.googleapis.com/css?family=Montserrat"
                }
            , Font.sansSerif
            ]
        ]
    <|
        column [ width <| px 960, centerX, spacing 50 ] [ navBar, body model, footer ]


navBar : Element Msg
navBar =
    row
        [ width fill
        , paddingEach { bottom = 0, left = 0, right = 0, top = 20 }

        -- , Background.color apple
        ]
        [ rightNav
        , leftNav
        ]


rightNav : Element Msg
rightNav =
    image [ scale 0.5 ]
        { src = "first_logo.png"
        , description = "Logo"
        }


leftNav : Element Msg
leftNav =
    row [ alignRight, spacing 20 ] [ text "Home", text "About" ]


body : Model -> Element Msg
body model =
    column [ spacing 50, width fill ] [ heroPart, bigText, experience, contactMe model ]


heroPart : Element Msg
heroPart =
    row [ width fill, spaceEvenly, padding 50 ]
        [ column
            [ height fill, spacing 50 ]
            [ paragraph
                [ paddingEach { bottom = 0, left = 0, right = 0, top = 0 }
                , Font.size 20
                , Font.bold
                ]
                [ text "Only Measuring Scale" ]
            , paragraph
                [ paddingEach { bottom = 0, left = 0, right = 0, top = 0 }
                , Font.size 44
                , Font.bold
                ]
                [ text "Honesty and Truth" ]
            ]
        , column
            [ centerY
            , Border.widthEach { right = 1, left = 0, top = 0, bottom = 0 }
            , Border.color <| rgb255 0xE0 0xE0 0xE0
            , height <| px 200
            ]
            []
        , column
            [-- Background.color neonRed
            ]
            [ image
                [ scale 2
                , padding 30
                ]
                { src = "rotating_clock.gif"
                , description = "An image"
                }
            ]
        ]


bigText : Element Msg
bigText =
    column
        [ width fill

        -- , Background.color apple
        ]
        [ paragraph
            [ paddingEach { bottom = 30, left = 0, right = 0, top = 0 }
            , width <| px 600
            , Font.size 36
            , centerX
            ]
            [ text "Hi, I am a Flutter dev, and a UX designer from Bangladesh." ]
        , paragraph
            [ paddingEach { bottom = 0, left = 0, right = 0, top = 0 }
            , width <| px 600
            , Font.size 24
            , centerX
            ]
            [ text "With a strong passion for Knowledge and a very curious mind." ]
        ]


experience : Element Msg
experience =
    row
        [ width fill
        , paddingEach { bottom = 0, left = 0, right = 0, top = 100 }
        ]
        [ column [ spacing 30, width fill ]
            [ paragraph
                [ paddingEach { bottom = 0, left = 0, right = 0, top = 0 }
                , Font.size 36
                , Font.alignLeft
                ]
                [ text "My experience" ]
            , paragraph
                [ paddingEach { bottom = 0, left = 0, right = 0, top = 0 }
                , width <| px 700
                , Font.size 16

                -- , Background.color apple
                , Font.alignLeft
                , Font.color charcoalGrey
                ]
                [ text "I have some experience in developing and prototyping beautiful app with a pinch of Backend Development" ]
            , row [ spacing 30 ]
                [ singleExperience "N-techBD" "Back End Developer" "July 2020 — August 2020"
                , singleExperience "Pillar" "Flutter Developer" "September 2020 — forever"
                ]
            ]
        ]


singleExperience : String -> String -> String -> Element Msg
singleExperience companyName role timeline =
    column [ spacing 20, width <| px 200 ]
        [ paragraph
            [ paddingEach { bottom = 0, left = 0, right = 0, top = 0 }
            , Font.size 20
            , Font.alignLeft
            ]
            [ text companyName ]
        , paragraph
            [ paddingEach { bottom = 0, left = 0, right = 0, top = 0 }
            , Font.size 16
            , Font.alignLeft
            , Font.color charcoalGrey
            ]
            [ text role ]
        , paragraph
            [ paddingEach { bottom = 0, left = 0, right = 0, top = 0 }
            , Font.size 12
            , Font.alignLeft
            , Font.color charcoalGrey
            ]
            [ text timeline ]
        ]


contactMe : Model -> Element Msg
contactMe model =
    row
        [ width fill
        , height <| px 600
        , paddingEach { bottom = 0, left = 0, right = 0, top = 60 }
        ]
        [ column
            [ spacing 20
            , width fill
            , Background.color Colors.paleGrey
            ]
            [ paragraph
                [ paddingEach { bottom = 0, left = 0, right = 0, top = 50 }
                , Font.size 30
                , Font.alignLeft
                ]
                [ text "Want to get in touch?" ]
            , paragraph
                [ paddingEach { bottom = 0, left = 0, right = 0, top = 0 }
                , Font.size 30
                , Font.alignLeft
                ]
                [ text "Drop me a line!" ]
            , paragraph
                [ paddingEach { bottom = 0, left = 0, right = 0, top = 0 }
                , Font.size 16
                , Font.alignLeft
                , Font.color charcoalGrey
                ]
                [ text "I will be very happy to talk about any opportunity & possiblity" ]
            , row [ spacing 20 ]
                [ nameForm model
                , emailForm model
                ]
            , messageForm model
            , sendButton model
            , el [ padding 25 ] (text "")
            ]
        ]


nameForm : Model -> Element Msg
nameForm model =
    Input.text
        [ height shrink
        , spacing 12
        , width <| px 340
        ]
        { text = model.name
        , placeholder = Just (Input.placeholder [] (text "Name"))
        , onChange = \new -> Update { model | name = new }
        , label = Input.labelAbove [ Font.size 14, alignLeft ] (text "Name")
        }


emailForm : Model -> Element Msg
emailForm model =
    Input.text
        [ height shrink
        , spacing 12
        , width <| px 340
        ]
        { text = model.email
        , placeholder = Just (Input.placeholder [] (text "E-mail"))
        , onChange = \new -> Update { model | email = new }
        , label = Input.labelAbove [ Font.size 14, alignLeft ] (text "Email")
        }


messageForm : Model -> Element Msg
messageForm model =
    Input.multiline
        [ height shrink
        , spacing 12
        , width <| px 700
        ]
        { text = model.message
        , placeholder = Just (Input.placeholder [] (text "message"))
        , onChange = \new -> Update { model | message = new }
        , label = Input.labelAbove [ Font.size 14, alignLeft ] (text "Leave a message")
        , spellcheck = False
        }


sendButton : Model -> Element Msg
sendButton model =
    Input.button
        [ Background.color dark
        , Font.color white
        , paddingXY 32 16
        , Border.rounded 3
        , width <| px 200
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
