module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Events
import Key exposing (Key)
import Layout exposing (Layout)
import Platform.Cmd as Cmd
import Svg exposing (Svg)
import Svg.Attributes


type alias Model =
    { filter : Key -> Bool
    , word : Maybe String
    }


type Msg
    = All
    | Letters
    | Vowels
    | Consonants
    | Numbers
    | Specials
    | Punctuation
    | Word String


init : () -> ( Model, Cmd Msg )
init _ =
    ( { filter = \_ -> True, word = Nothing }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        All ->
            ( { model | filter = \_ -> True }, Cmd.none )

        Letters ->
            ( { model | filter = Key.isLetter }, Cmd.none )

        Vowels ->
            ( { model | filter = Key.isVowel }, Cmd.none )

        Consonants ->
            ( { model | filter = Key.isConsonant }, Cmd.none )

        Numbers ->
            ( { model | filter = Key.isNumber }, Cmd.none )

        Specials ->
            ( { model | filter = Key.isSpecial }, Cmd.none )

        Punctuation ->
            ( { model | filter = Key.isPunctuation }, Cmd.none )

        Word word ->
            ( { model | filter = Key.isInWord word, word = Just word }, Cmd.none )


key_width =
    50


key_height =
    50


type alias RenderInfo =
    { layout : Layout
    , keys : List (Svg Msg)
    , x : Int
    , x_max : Int
    , y : Int
    , y_max : Int
    , renderText : Key -> Bool
    }


renderKey : Key -> RenderInfo -> Int -> List (Svg Msg)
renderKey key render_info width =
    let
        key_rect =
            Svg.rect
                [ Svg.Attributes.x (String.fromInt render_info.x)
                , Svg.Attributes.y (String.fromInt render_info.y)
                , Svg.Attributes.width (String.fromInt width)
                , Svg.Attributes.height (String.fromInt key_height)
                , Svg.Attributes.fill "darkgreen"
                , Svg.Attributes.stroke "white"
                ]
                []
        key_text =
            Svg.text_
                [ Svg.Attributes.x (String.fromInt (render_info.x + 5))
                , Svg.Attributes.y (String.fromInt (render_info.y + 30))
                , Svg.Attributes.fontSize (String.fromInt 13)
                , Svg.Attributes.fill "black"
                , Svg.Attributes.textAnchor "top"
                ]
                [ Svg.text (Key.toString key) ]
    in
    if (render_info.renderText key) then
        [ key_rect, key_text ]
    else
        [ key_rect ]



keyRect : Key -> RenderInfo -> RenderInfo
keyRect key render_info =
    let
        width =
            round (key_width * render_info.layout.widthFactor key)
    in
    { render_info
    | keys = (renderKey key render_info width) ++ render_info.keys
    , x = render_info.x + width
    , x_max = max render_info.x_max (render_info.x + width)
    }


keyRows : List Key -> RenderInfo -> RenderInfo
keyRows row_keys render_info =
    List.foldl
        keyRect
        { render_info
        | x = 0
        , y = render_info.y + key_height
        , y_max = render_info.y_max + key_height
        }
        row_keys


renderLayout : (Key -> Bool) -> Layout -> RenderInfo
renderLayout filter layout =
    List.foldl
        keyRows
        { layout = layout
        , keys = []
        , x = 0
        , x_max = 0
        , y = -key_height
        , y_max = 0
        , renderText = filter
        }
        layout.keys


view : Model -> Html Msg
view model =
    let
        info = renderLayout model.filter Layout.lenovo
    in
    Html.div []
        [ Html.div []
            [ Svg.svg
                [ Svg.Attributes.viewBox (String.join " " (List.map String.fromInt [ 0, 0, info.x_max, info.y_max ]))
                , Svg.Attributes.width (String.fromInt info.x_max)
                , Svg.Attributes.height (String.fromInt info.y_max)
                ]
                info.keys
            ]
        , Html.button [ Html.Events.onClick All ] [ Html.text "Show All" ]
        , Html.button [ Html.Events.onClick Letters ] [ Html.text "Letters" ]
        , Html.button [ Html.Events.onClick Vowels ] [ Html.text "Vowels" ]
        , Html.button [ Html.Events.onClick Consonants ] [ Html.text "Consonants" ]
        , Html.button [ Html.Events.onClick Numbers ] [ Html.text "Numbers" ]
        , Html.button [ Html.Events.onClick Specials ] [ Html.text "Specials" ]
        , Html.button [ Html.Events.onClick Punctuation ] [ Html.text "Punctuation" ]
        , Html.button [ Html.Events.onClick (Word "RazzleDazzle") ] [ Html.text "Word" ]
        ]


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
