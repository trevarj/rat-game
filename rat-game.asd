(asdf:defsystem rat-game
  :components ((:file "package")
               (:file "main")
               (:file "rat"))
  :depends-on (:trial
               :trial-glfw
               :trial-png))
