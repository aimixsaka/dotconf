config.load_autoconfig(False)

c.content.pdfjs = True
c.zoom.default = "130%"
c.editor.command = ["ghostty", "-e", "vis", "{file}"]
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

# mpv
config.bind(",m", "spawn umpv {url}")
config.bind(",M", "hint links spawn umpv {hint-url}")
config.bind(";M", "hint --rapid links spawn umpv {hint-url}")

config.bind(",t", "spawn --userscript translate.janet")

config.bind("<F2>", "config-edit")
config.bind("<Ctrl-E>", "config-cycle tabs.show always never")
config.bind("=", "zoom-in")

config.unbind("d")
config.unbind("u")
config.unbind("U")

config.bind("u", "scroll-page 0 -0.5")
config.bind("d", "scroll-page 0 +0.5")
config.bind("U", "undo")
