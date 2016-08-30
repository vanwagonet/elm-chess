module Chess.Model exposing (..)

import Array exposing (Array, fromList)

type alias Model =
  { board: Board
  , turn: Color
  , selected: Maybe Piece
  , moves: List Move
  }

type alias Board = Array Row
type alias Row = Array Cell
type alias Cell = Maybe Piece

type alias Piece =
  { id: Int -- makes each unique for == use
  , color: Color
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

type alias Move =
  { kill: Maybe Piece
  , column: Int
  , row: Int
  }

initialModel : Model
initialModel =
  Model initialBoard White Nothing []

initialBoard : Board
initialBoard = fromList
  [ fromList
    [ Just (Piece 1 White Rook)
    , Just (Piece 2 White Knight)
    , Just (Piece 3 White Bishop)
    , Just (Piece 4 White Queen)
    , Just (Piece 5 White King)
    , Just (Piece 6 White Bishop)
    , Just (Piece 7 White Knight)
    , Just (Piece 8 White Rook)
    ]
  , fromList
    [ Just (Piece 9 White Pawn)
    , Just (Piece 10 White Pawn)
    , Just (Piece 11 White Pawn)
    , Just (Piece 12 White Pawn)
    , Just (Piece 13 White Pawn)
    , Just (Piece 14 White Pawn)
    , Just (Piece 15 White Pawn)
    , Just (Piece 16 White Pawn)
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
    [ Just (Piece 17 Black Pawn)
    , Just (Piece 18 Black Pawn)
    , Just (Piece 19 Black Pawn)
    , Just (Piece 20 Black Pawn)
    , Just (Piece 21 Black Pawn)
    , Just (Piece 22 Black Pawn)
    , Just (Piece 23 Black Pawn)
    , Just (Piece 24 Black Pawn)
    ]
  , fromList
    [ Just (Piece 25 Black Rook)
    , Just (Piece 26 Black Knight)
    , Just (Piece 27 Black Bishop)
    , Just (Piece 28 Black Queen)
    , Just (Piece 29 Black King)
    , Just (Piece 30 Black Bishop)
    , Just (Piece 31 Black Knight)
    , Just (Piece 32 Black Rook)
    ]
  ]
