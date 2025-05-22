config.load_autoconfig(False)

c.content.pdfjs = True
c.zoom.default = "130%"
c.auto_save.session = True
c.spellcheck.languages = ["en-US"]
c.tabs.position = "left"
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "sn": "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={}",
    "aur": "https://aur.archlinux.org/packages?O=0&K={}",
}
# c.fonts.default_size = "18pt"
c.fonts.web.size.default = 18
# c.fonts.web.size.default_fixed = 20

## Reference: https://git.sr.ht/~willvaughn/dots/tree/main/item/.config/qutebrowser/qutemacs.py
c.editor.command = ["emacsclient", "-c", "{file}"]
# mpv
config.bind(",m", "spawn umpv {url}")
config.bind(",M", "hint links spawn umpv {hint-url}")
config.bind(";M", "hint --rapid links spawn umpv {hint-url}")

config.bind("<F2>", "config-edit")
config.bind("<Ctrl-E>", "config-cycle tabs.show always never")
config.bind("=", "zoom-in")

## Move related
config.unbind("d")
config.unbind("u")
config.unbind("U")
config.unbind("<Ctrl-u>")
config.unbind("<Ctrl-d>")
# config.unbind("gg")
# config.unbind("G")

config.bind("<Ctrl-v>", "scroll-page 0 0.5")
config.bind("<Alt-v>", "scroll-page 0 -0.5")
config.bind("U", "undo")
config.bind("[b", "scroll-to-perc 0")
config.bind("]b", "scroll-to-perc")

## Command
config.unbind(":")
config.unbind("<Escape>")
config.bind("<Alt-x>", "cmd-set-text :")
config.bind("<Ctrl-g>", "clear-keychain ;; search ;; fullscreen --leave")
config.bind("<Ctrl-g>", "mode-leave", mode="insert")
config.bind("<Ctrl-;>", "mode-leave", mode="insert")
config.bind("<Ctrl-g>", "mode-leave", mode="command")
config.bind("<Ctrl-g>", "mode-leave", mode="prompt")
config.bind("<Ctrl-g>", "mode-leave", mode="register")
config.bind("<Ctrl-g>", "mode-leave", mode="yesno")
config.bind("<Ctrl-g>", "mode-leave", mode="hint")
config.bind("<Ctrl-g>", "mode-leave", mode="caret")

## Caret(visual)
config.unbind("v")
config.unbind("V")
config.unbind("<Space>", mode="caret")
config.bind("<Ctrl-Space>", "mode-enter caret")
config.bind("<Ctrl-Space>", "selection-toggle", mode="caret")


## Macro
config.unbind("q")
config.unbind("@")
config.bind("<F3>", "macro-record")
config.bind("<F4>", "macro-run")
config.bind("<Ctrl-x>(", "macro-record")
config.bind("<Ctrl-x>)", "macro-record")
config.bind("<Ctrl-x>e", "macro-run")

## Search
config.unbind("/")
config.unbind("?")
config.bind("<Ctrl-s>", "cmd-set-text /")
config.bind("<Ctrl-r>", "cmd-set-text ?")
config.bind("<Ctrl-s>", "search-next", mode="command")
config.bind("<Ctrl-r>", "search-prev", mode="command")
