module Chess.Action where

type Action = Select | Move

update action model =
  model
