(asdf:defsystem rat-game
  :components ((:file "package")
               (:file "assets")
               (:file "main")
               (:file "rat")
               (:file "boulder"))
  :depends-on (:trial
               :trial-glfw
               :trial-png)
  :build-operation "deploy-op"
  :build-pathname
  #+linux "rat-game-linux.run"
  #+darwin "rat-game-macos.o"
  #+win32 "rat-game-windows"
  #+(and bsd (not darwin)) "rat-game-bsd.run"
  #-(or linux bsd win32) "rat-game"
  :entry-point "ratgame::launch"
  :defsystem-depends-on (:deploy))
