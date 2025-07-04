#!/usr/bin/janet

(def selected (os/getenv "QUTE_SELECTED_TEXT"))
(spit (os/getenv "QUTE_FIFO") (string/format
		"open -t https://translate.google.com/?sl=auto&tl=zh-CN&text=%s&op=translate" selected))