module Main exposing (..)

import Browser
import Browser.Events
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import Json.Decode as Decode



-- Model


type alias Model =
    { paddle : { x : Float, width : Float, height : Float }
    , ball : { x : Float, y : Float, dx : Float, dy : Float, size : Float }
    }


initialModel : Model
initialModel =
    { paddle = { x = 150, width = 100, height = 20 }
    , ball = { x = 200, y = 200, dx = 2, dy = 2, size = 10 }
    }



-- Update


type Msg
    = NoOp
    | LeftPressed
    | RightPressed



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Browser.Events.onKeyDown (Decode.map keyDecoder Decode.string)



-- keyDecoder


keyDecoder : String -> Msg
keyDecoder key =
    case key of
        "a" ->
            LeftPressed

        "d" ->
            RightPressed

        _ ->
            NoOp


update : Msg -> Model -> Model
update _ model =
    model



-- View


view : Model -> Html Msg
view model =
    div []
        [ div
            [ style "position" "absolute"
            , style "left" (String.fromFloat model.paddle.x ++ "px")
            , style "bottom" "30px"
            , style "width" (String.fromFloat model.paddle.width ++ "px")
            , style "height" (String.fromFloat model.paddle.height ++ "px")
            , style "background-color" "blue"
            ]
            []
        , div
            [ style "position" "absolute"
            , style "left" (String.fromFloat model.ball.x ++ "px")
            , style "top" (String.fromFloat model.ball.y ++ "px")
            , style "width" (String.fromFloat model.ball.size ++ "px")
            , style "height" (String.fromFloat model.ball.size ++ "px")
            , style "background-color" "red"
            , style "border-radius" "50%"
            ]
            []
        ]



-- Main


main : Program () Model Msg
main =
    Browser.sandbox { init = initialModel, update = update, view = view }
