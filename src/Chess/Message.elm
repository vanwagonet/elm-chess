module Chess.Message exposing (..)

import Chess.Model exposing (Model, Cell)

type Message =
  Click Cell

update : Message -> Model -> ( Model, Cmd Message )
update message model =
  case message of
    Click cell ->
      model ! []
