(defun synthesize-multiple-events (&rest events)
  (mapc (lambda (e)
          (synthesize-event e (input-focus)))
        events))
(bind-keys global-keymap "Next" '(if (string-match (window-class (input-focus)) "Qpdfview")
                                     (synthesize-multiple-events "SPC")
                                   (synthesize-multiple-events "Next")))
(bind-keys global-keymap "Prior" '(if (string-match (window-class (input-focus)) "Qpdfview")
                                      (synthesize-multiple-events "BS")
                                    (synthesize-multiple-events "Prior")))
(bind-keys global-keymap "S-Up" '(synthesize-multiple-events "Up"))
(bind-keys global-keymap "S-Down" '(synthesize-multiple-events "Down"))
(bind-keys global-keymap "S-Left" '(synthesize-multiple-events "Left"))
(bind-keys global-keymap "S-Right" '(synthesize-multiple-events "Right"))
(bind-keys global-keymap "F1" '(synthesize-multiple-events "ESC" "g" "f" "RET"))
(bind-keys global-keymap "F2" '(synthesize-multiple-events "ESC" "g" "r" "RET"))
(bind-keys global-keymap "F3" '(synthesize-multiple-events "ESC" "." "RET"))
(bind-keys global-keymap "F4" '(synthesize-multiple-events "ESC" "g" "m"))
(bind-keys global-keymap "F6" '(synthesize-multiple-events "ESC" "g" "f" "RET"))
(bind-keys global-keymap "F7" '(synthesize-multiple-events "ESC" "g" "r" "RET"))
(bind-keys global-keymap "F8" '(synthesize-multiple-events "ESC" "." "RET"))
(bind-keys global-keymap "F9" '(synthesize-multiple-events "ESC" "g" "m"))
(bind-keys global-keymap "F23" '(synthesize-multiple-events "ESC" "C-u"))
(bind-keys global-keymap "F24" '(synthesize-multiple-events "ESC" "C-d"))
(bind-keys global-keymap "XF86Back" '(synthesize-multiple-events "ESC" "C-b"))
(bind-keys global-keymap "XF86Forward" '(synthesize-multiple-events "ESC" "C-f"))
(bind-keys global-keymap "KP_Equal" '(synthesize-multiple-events "C-x" "w"))
(bind-keys global-keymap "Left" '(synthesize-multiple-events "ESC" "C-,"))
(bind-keys global-keymap "Right" '(synthesize-multiple-events "ESC" "C-."))
(bind-keys global-keymap "Home" '(synthesize-multiple-events "ESC" "C-a"))
(bind-keys global-keymap "End" '(synthesize-multiple-events "ESC" "C-e"))
(bind-keys global-keymap "F11"  '(progn
                                   (maximize-window (input-focus))
                                   (synthesize-multiple-events "C-x" "1")))
(bind-keys global-keymap "Up" '(synthesize-multiple-events "ESC" "g" "p"))
(bind-keys global-keymap "Down" '(synthesize-multiple-events "ESC" "g" "n"))

(bind-keys global-keymap "F5"
           '(progn
              (read-event
               "
                ^



<     Click on the screen     >



                V" )
              (let* ((xy (query-pointer))
                     (x (car xy))
                     (y (cdr xy))
                     (w (screen-width))
                     (h (screen-height)))
                (message (format nil "x is %d, y is %d, w is %d, h is %d" x y w h))
                (cond
                 ((< x (/ w 3)) ; left
                  (message "going left")
                  (synthesize-multiple-events "ESC" "C-,"))
                 ((> x (- w (/ w 3))) ; right
                  (message "going right")
                  (synthesize-multiple-events "ESC" "C-."))
                 ((< y (/ h 3))
                  (message "going up")
                  (synthesize-multiple-events "ESC" "C-a"))
                 ((> y (- h (/ h 3)))
                  (message "going down")
                  (synthesize-multiple-events "ESC" "C-e"))))))
