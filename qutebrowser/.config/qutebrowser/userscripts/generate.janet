#!/usr/bin/janet

(defn def-qute-script [name command]
	(def script-path (string
											(string/trim (os/getenv "XDG_CONFIG_HOME" "~/.config"))
											"/qutebrowser/userscripts/"
											name ".janet"))
	(unless (os/stat script-path)
			(def out-text (string/format `
#!/usr/bin/janet

(def selected (os/getenv "QUTE_SELECTED_TEXT"))
(spit (os/getenv "QUTE_FIFO") %s)`
	command))
			(spit script-path out-text)
			(os/shell (string/format "chmod +x %s" script-path))))

(def-qute-script "translate"
	`(string/format
		"open -t https://translate.google.com/?sl=auto&tl=zh-CN&text=%s&op=translate" selected)`)
