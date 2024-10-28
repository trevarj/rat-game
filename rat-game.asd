(asdf:defsystem rat-game
  :components ((:file "package")
               (:file "assets")
               (:file "main")
               (:file "rat")
               (:file "boulder"))
  :depends-on (:trial
               :trial-glfw
               :trial-png))
