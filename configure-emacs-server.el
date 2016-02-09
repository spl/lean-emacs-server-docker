;; Set up server
(setq server-use-tcp t)
(setq server-host "0.0.0.0")
(setq server-port "7734")
(setq server-auth-dir "/server") ;; See VOLUME in Dockerfile

;; Start server
(server-start)
