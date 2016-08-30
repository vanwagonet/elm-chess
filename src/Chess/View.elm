module Chess.View exposing (view)

import Array exposing (Array, toList)
import Html exposing (Html, Attribute, table, tr, td, span, div, text)
import Html.Attributes exposing (attribute, class)
import Html.Events exposing (onClick)

import Chess.Message exposing (..)
import Chess.Model exposing (..)

view : Model -> Html Message
view model =
  let
    className =
      case model.turn of
        White -> "chess-board chess-turn--white"
        Black -> "chess-board chess-turn--black"
  in
    Array.indexedMap (rowView model) model.board
    |> toList
    |> table [ class className ]

rowView : Model -> Int -> Row -> Html Message
rowView model r row =
  Array.indexedMap (cellView model r) row
  |> toList
  |> tr [ class "chess-row" ]

cellView : Model -> Int -> Int -> Cell -> Html Message
cellView model r c cell =
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
    td [ class className, onClick (Click cell) ] children

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

pieceView : Piece -> List (Html Message)
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

pieceSpan : Color -> String -> String -> List (Html Message)
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
