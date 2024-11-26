module Main exposing (..)

import Html exposing (Html, text, div, img)
import Html.Attributes exposing (src)


type alias Model = 
{
    gameState : GameState,
    playerStats : Player 
}

type GameState 
= NotPlaying
| Playing
| GameOver


type alias Player = 
{ score : Int,
lives : Int}