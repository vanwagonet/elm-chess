module Chess.Model where

import Array exposing (Array, fromList)

type alias Model =
  { board: Board
  , turn: Color
  }

type alias Board = Array Row
type alias Row = Array Cell
type alias Cell = Maybe Piece

type alias Piece =
  { color: Color
  , rank: Rank
  }

type Color = Black | White

type Rank
  = Pawn
  | Rook
  | Knight
  | Bishop
  | Queen
  | King

model =
  Model board White

board = fromList
  [ fromList
    [ Just (Piece White Rook)
    , Just (Piece White Knight)
    , Just (Piece White Bishop)
    , Just (Piece White Queen)
    , Just (Piece White King)
    , Just (Piece White Bishop)
    , Just (Piece White Knight)
    , Just (Piece White Rook)
    ]
  , fromList
    [ Just (Piece White Pawn)
    , Just (Piece White Pawn)
    , Just (Piece White Pawn)
    , Just (Piece White Pawn)
    , Just (Piece White Pawn)
    , Just (Piece White Pawn)
    , Just (Piece White Pawn)
    , Just (Piece White Pawn)
    ]
  , fromList
    [ Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing ]
  , fromList
    [ Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing ]
  , fromList
    [ Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing ]
  , fromList
    [ Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing ]
  , fromList
    [ Just (Piece Black Pawn)
    , Just (Piece Black Pawn)
    , Just (Piece Black Pawn)
    , Just (Piece Black Pawn)
    , Just (Piece Black Pawn)
    , Just (Piece Black Pawn)
    , Just (Piece Black Pawn)
    , Just (Piece Black Pawn)
    ]
  , fromList
    [ Just (Piece Black Rook)
    , Just (Piece Black Knight)
    , Just (Piece Black Bishop)
    , Just (Piece Black Queen)
    , Just (Piece Black King)
    , Just (Piece Black Bishop)
    , Just (Piece Black Knight)
    , Just (Piece Black Rook)
    ]
  ]
