(in-package #:ratgame)

(define-shader-entity boulder (animated-sprite located-entity)
  ((sprite-data :initform (asset 'ratgame 'boulder))
   (state :initform :moving :accessor state)))

(define-handler (boulder tick :before) (dt)
  (let* ((speed 200.0)
         (loc (location boulder))
         (y (vy loc)))
    (case (state boulder)
      (:moving
       (cond
         ((<= y -200)
          (leave (node :rat *world*) *world*)
          (setf (state boulder) :hit)
          (play 'hit boulder))
         (T (incf (vy (location boulder)) (* dt speed -1))
            (setf (vx (location boulder)) (vx (location
                                               (node :rat *world*)))))))
      (:hit
       (if (>= y -220)
           (incf (vy (location boulder)) (* dt speed -1))
           (setf (state boulder) :done))))))
