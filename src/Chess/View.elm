module Chess.View where

import Array exposing (Array, toList)
import Html exposing (Html, Attribute, table, tr, td, span, div, text)
import Html.Attributes exposing (attribute, class)
import Html.Events exposing (onClick)

import Chess.Action exposing (..)
import Chess.Model exposing (..)

view : Signal.Address Action -> Model -> Html
view address model =
  let
    className =
      case model.turn of
        White -> "chess-board chess-turn--white"
        Black -> "chess-board chess-turn--black"
  in
    Array.indexedMap (rowView address model) model.board
    |> toList
    |> table [ class className ]

rowView : Signal.Address Action -> Model -> Int -> Row -> Html
rowView address model r row =
  Array.indexedMap (cellView address model r) row
  |> toList
  |> tr [ class "chess-row" ]

cellView : Signal.Address Action -> Model -> Int -> Int -> Cell -> Html
cellView address model r c cell =
  let
    children =
      case cell of
        Just piece -> pieceView piece
        Nothing -> []
    evenOdd =
      if (r - c) % 2 == 0
      then "even"
      else "odd"
    highlight = cellHighlight model cell r c
    className = "chess-square"
      ++ " chess-square--" ++ evenOdd
      ++ " chess-square--" ++ highlight
  in
    td [ class className, onClick address (Click cell) ] children

cellHighlight: Model -> Cell -> Int -> Int -> String
cellHighlight model cell r c =
  case cell of
    Nothing -> "empty"
    Just piece ->
      case model.selected of
        Nothing -> "occupied"
        Just selected ->
          if piece == selected then "selected"
          else "occupied"

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
