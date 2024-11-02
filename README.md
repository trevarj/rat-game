
# rat-game

![gif](./rat-game.gif)

### Controls 
w - left
d - right

## Run

### From Release
1. Unzip rat-game.zip
2. Run executable: `./rat-game-linux.run`

### From Source

After this project is in ~/quicklisp/local-projects/:

```lisp
(ql:quickload "rat-game")
(org.ratgame:launch)
```

## Building

Start sbcl (outside of emacs)
```sh
sbcl --dynamic-memory-size 4Gb
```

```lisp
(ql:quickload "rat-game")
(asdf:make "rat-game")
```
