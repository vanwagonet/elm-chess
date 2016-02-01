module Chess where

import Array exposing (Array, fromList, toList)
import Html exposing (Html, table, tr, td, text)

-- MODEL

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

initialModel =
  Model initialBoard White

initialBoard = fromList
  [ fromList
    [ Just (Piece Black Rook)
    , Just (Piece Black Knight)
    , Just (Piece Black Bishop)
    , Just (Piece Black Queen)
    , Just (Piece Black King)
    , Just (Piece Black Bishop)
    , Just (Piece Black Knight)
    , Just (Piece Black Rook)
    ]
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
    [ Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing ]
  , fromList
    [ Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing ]
  , fromList
    [ Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing ]
  , fromList
    [ Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing ]
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
    [ Just (Piece White Rook)
    , Just (Piece White Knight)
    , Just (Piece White Bishop)
    , Just (Piece White Queen)
    , Just (Piece White King)
    , Just (Piece White Bishop)
    , Just (Piece White Knight)
    , Just (Piece White Rook)
    ]
  ]

-- VIEW

view : Model -> Html
view model =
  Array.map rowView model.board
  |> toList
  |> table []

rowView : Row -> Html
rowView row =
  Array.map cellView row
  |> toList
  |> tr []

cellView : Cell -> Html
cellView cell =
  let
    value =
      case cell of
        Just piece -> pieceText piece
        Nothing -> " "
  in
    td [] [ text value ]

pieceText : Piece -> String
pieceText piece =
  case piece.rank of
    Pawn ->
      case piece.color of
        White -> "♙"
        Black -> "♟"
    Rook ->
      case piece.color of
        White -> "♖"
        Black -> "♜"
    Knight ->
      case piece.color of
        White -> "♘"
        Black -> "♞"
    Bishop ->
      case piece.color of
        White -> "♗"
        Black -> "♝"
    Queen ->
      case piece.color of
        White -> "♕"
        Black -> "♛"
    King ->
      case piece.color of
        White -> "♔"
        Black -> "♚"

main =
  view initialModel
