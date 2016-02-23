module Chess where

import StartApp.Simple as StartApp

import Chess.Action exposing (update)
import Chess.Model exposing (model)
import Chess.View exposing (view)

main =
  StartApp.start { model = model, view = view, update = update }
