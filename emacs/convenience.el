(defun stationary-scroll-up (distance)
  (interactive)
  (scroll-lock-mode t)
  (scroll-down distance)
  (scroll-lock-mode -1))

(defun stationary-scroll-down (distance)
  (interactive)
  (scroll-lock-mode t)
  (scroll-up distance)
  (scroll-lock-mode -1))

(defun cursor-jump-down ()
  (interactive)
  (next-line 5))

(defun cursor-jump-up ()
  (interactive)
  (next-line -5))
