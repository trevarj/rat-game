(directional move
             (keys :one-of ((:w :a :s :d))))

(trigger quit-game
         (key :one-of (:q :esc :escape)))

(trigger restart-game
         (key :one-of (:f2)))
