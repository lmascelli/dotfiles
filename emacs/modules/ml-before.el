;; Increase the garbage collector threshold for faster startup
;; The default threshold is 800 kilobytes.
(setq gc-cons-threshold (* 50 1000 1000))

(provide ml-before)
