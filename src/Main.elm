module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes
import Html.Events
import Json.Decode as Json
import Key exposing (Key)
import Layout exposing (Layout)
import Platform.Cmd as Cmd
import Svg exposing (Svg)
import Svg.Attributes


type alias Model =
    { filter : Key -> Bool
    , string : Maybe String
    }


type Msg
    = All
    | Letters
    | Vowels
    | Consonants
    | Numbers
    | Specials
    | Punctuation
    | StringUpdate String
    | StringFilter
    | StringKeyUp Int


init : () -> ( Model, Cmd Msg )
init _ =
    ( { filter = \_ -> True, string = Nothing }, Cmd.none )


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

        StringUpdate string ->
            if String.isEmpty string then
                ( { model | string = Nothing }, Cmd.none )

            else
                ( { model | string = Just string }, Cmd.none )

        StringFilter ->
            case model.string of
                Nothing ->
                    ( { model | filter = \_ -> True }, Cmd.none )

                Just string ->
                    ( { model | filter = Key.isInString string }, Cmd.none )

        StringKeyUp key_num ->
            if key_num == 13 then
                update StringFilter model
            else
                ( model, Cmd.none )


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


-- A custom event handlers for the keyup and keydown events. They decode
-- the incoming event data and send the key code with the message to the
-- update function.
onKeyUp : (Int -> msg) -> Html.Attribute msg
onKeyUp tagger =
    Html.Events.on "keyup" (Json.map tagger Html.Events.keyCode)


onKeyDown : (Int -> msg) -> Html.Attribute msg
onKeyDown tagger =
    Html.Events.on "keydown" (Json.map tagger Html.Events.keyCode)


renderKey : Key -> RenderInfo -> Int -> List (Svg Msg)
renderKey key render_info width =
    let
        key_rect =
            Svg.rect
                [ Svg.Attributes.x (String.fromInt render_info.x)
                , Svg.Attributes.y (String.fromInt render_info.y)
                , Svg.Attributes.width (String.fromInt width)
                , Svg.Attributes.height (String.fromInt key_height)
                , Svg.Attributes.fill "#2F2F2F"
                , Svg.Attributes.stroke "white"
                ]
                []

        key_text =
            Svg.text_
                [ Svg.Attributes.x (String.fromInt (render_info.x + 5))
                , Svg.Attributes.y (String.fromInt (render_info.y + 30))
                , Svg.Attributes.fontSize (String.fromInt 13)
                , Svg.Attributes.fill "white"
                , Svg.Attributes.textAnchor "top"
                ]
                [ Svg.text (Key.toString key) ]
    in
    if render_info.renderText key then
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
        | keys = renderKey key render_info width ++ render_info.keys
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
        info =
            renderLayout model.filter Layout.lenovo
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
        , Html.div []
            [ Html.button [ Html.Events.onClick All ] [ Html.text "Show All" ]
            , Html.button [ Html.Events.onClick Letters ] [ Html.text "Letters" ]
            , Html.button [ Html.Events.onClick Vowels ] [ Html.text "Vowels" ]
            , Html.button [ Html.Events.onClick Consonants ] [ Html.text "Consonants" ]
            , Html.button [ Html.Events.onClick Numbers ] [ Html.text "Numbers" ]
            , Html.button [ Html.Events.onClick Specials ] [ Html.text "Specials" ]
            , Html.button [ Html.Events.onClick Punctuation ] [ Html.text "Punctuation" ]
            ]
        , Html.div []
            [ Html.button [ Html.Events.onClick StringFilter ] [ Html.text "Input" ]
            , Html.input
                [ Html.Attributes.placeholder "Type a string to filter the keys!"
                , Html.Attributes.value (Maybe.withDefault "" model.string)
                , Html.Events.onInput StringUpdate
                , onKeyUp StringKeyUp
                ]
                []
            ]
        ]


main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }
