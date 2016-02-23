module Chess.View where

import Array exposing (Array, toList)
import Html exposing (Html, Attribute, table, tr, td, span, text)
import Html.Attributes exposing (attribute, class)

import Chess.Action exposing (..)
import Chess.Model exposing (..)

view : Signal.Address Action -> Model -> Html
view address model =
  Array.indexedMap rowView model.board
  |> toList
  |> table [ class "chess-board" ]

rowView : Int -> Row -> Html
rowView r row =
  Array.indexedMap (cellView r) row
  |> toList
  |> tr [ class "chess-row" ]

cellView : Int -> Int -> Cell -> Html
cellView r c cell =
  let
    children =
      case cell of
        Just piece -> pieceView piece
        Nothing -> []
    className =
      if (r - c) % 2 == 0
      then "chess-square chess-square--even"
      else "chess-square chess-square--odd"
  in
    td [ class className ] children

pieceView : Piece -> List Html
pieceView piece =
  case piece.rank of
    Pawn ->
      pieceSpan piece.color "♙" "♟"
    Rook ->
      pieceSpan piece.color "♖" "♜"
    Knight ->
      pieceSpan piece.color "♘" "♞"
    Bishop ->
      pieceSpan piece.color "♗" "♝"
    Queen ->
      pieceSpan piece.color "♕" "♛"
    King ->
      pieceSpan piece.color "♔" "♚"

pieceSpan : Color -> String -> String -> List Html
pieceSpan color whiteText blackText =
  let
    className =
      case color of
        White -> "chess-piece chess-piece--white"
        Black -> "chess-piece chess-piece--black"
    fgText =
      case color of
        White -> whiteText
        Black -> blackText
  in
    [ span []
      [ span
        [ class className
        , attribute "aria-hidden" "true"
        , attribute "data-fill" blackText
        , attribute "data-stroke" whiteText
        ]
        []
      , span [ class "chess-piece-text" ] [ text fgText ]
      ]
    ]
