config.load_autoconfig(False)

c.editor.command = ["neovide", "{file}"]
c.auto_save.session = True
c.spellcheck.languages = ["en-US"]
c.tabs.position = "left"
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "aw": "https://wiki.archlinux.org/?search={}",
    "sn": "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={}",
}
c.fonts.web.size.default = 21

config.bind(",m", "spawn mpv {url}")
config.bind(",M", "hint links spawn --detach mpv {hint-url}")
config.bind("<F2>", "config-edit")
config.bind("<Ctrl-E>", "config-cycle tabs.show always never")
config.bind("=", "zoom-in")
