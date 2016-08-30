sources = \
	src/Chess.elm \
	src/Chess/Message.elm \
	src/Chess/Model.elm \
	src/Chess/View.elm

all: elm-chess.js

elm-chess.js: $(sources)
	elm make src/Chess.elm --output elm-chess.js

clean:
	rm elm-chess.js
