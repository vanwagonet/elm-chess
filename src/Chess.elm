module Chess exposing (main)

import Html.App as App

import Chess.Message exposing (Message, update)
import Chess.Model exposing (Model, initialModel)
import Chess.View exposing (view)

init : ( Model, Cmd Message )
init =
  initialModel ! []

main : Program Never
main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = \_ -> Sub.none
    }
