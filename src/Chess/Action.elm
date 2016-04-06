module Chess.Action where

import Chess.Model exposing (Cell)

type Action = Click Cell

update action model =
  case action of
    Click cell ->
      case model.selected of
        Nothing ->
          case cell of
            Nothing -> model
            Just piece ->
              if piece.color == model.turn then
                { model | selected = Just piece }
              else
                model
        Just selected -> model
