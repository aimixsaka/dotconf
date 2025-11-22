# config.nu
#
# Installed by:
# version = "0.107.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
let fish_completer = {|spans|
    fish --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {|row|
      let value = $row.value
      let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
      if ($need_quote and ($value | path exists)) {
        let expanded_path = if ($value starts-with ~) {$value | path expand --no-symlink} else {$value}
        $'"($expanded_path | str replace --all "\"" "\\\"")"'
      } else {$value}
    }
}

let carapace_completer = {|spans: list<string>|
    carapace $spans.0 nushell ...$spans
    | from json
    | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
}

# This completer will use carapace by default
let external_completer = {|spans|
    let expanded_alias = scope aliases
    | where name == $spans.0
    | get -o 0.expansion

    let spans = if $expanded_alias != null {
        $spans
        | skip 1
        | prepend ($expanded_alias | split row ' ' | take 1)
    } else {
        $spans
    }

    match $spans.0 {
        # carapace completions are incorrect for nu
        nu => $fish_completer
        # fish completes commits and branch names in a nicer way
        git => $fish_completer
        # carapace doesn't have completions for asdf
        asdf => $fish_completer
        _ => $carapace_completer
    } | do $in $spans
}

$env.config = {
    # ...
    completions: {
        external: {
            enable: true
            completer: $external_completer
        }
    }
    # ...
}

## envs
$env.EDITOR = "hx"

## prompt
def left_prompt [] {
    let blue = $"(ansi {fg: '#00AFFC', attr: b})"
    def folder [] {
        pwd | str replace '/home/aimi' '~'
    } 
    # let green = $"(ansi {fg: '#5FD700', attr: b})"
    let indicator = "\nλ "
    $"($blue)(folder)(ansi green)($indicator)(ansi reset)" 
} 

def right_prompt [] {
    let brown = $"(ansi {fg: '#B9AD87', attr: b})"
    let black = $"(ansi {fg: '#425D5D', attr: b})"
    $"($brown)(whoami)@(hostname) ($black)(^date '+%H:%M:%S')(ansi reset)"
}

$env.PROMPT_COMMAND = { || left_prompt }
$env.PROMPT_COMMAND_RIGHT = { || right_prompt }
$env.PROMPT_INDICATOR = ""

## aliases
alias pas = sudo pacman -S 
alias pasi = pacman -Si 
alias pasii = pacman -Sii 
alias pass = pacman -Ss 
alias passq = sudo pacman -Ssq 
alias paq = pacman -Q 
alias paqi = pacman -Qi 
alias paqii = pacman -Qii 
alias paql = pacman -Ql 
alias paqs = pacman -Qs 
alias paqqs = pacman -Qqs 
alias paqo = pacman -Qo 
alias paqqo = pacman -Qqo 
alias paqqdt = pacman -Qqdt 
alias paqqen = pacman -Qqen 
alias paqk = pacman -Qk 
alias paqkk = pacman -Qkk 
alias paclear = sudo pacman -Rns \$(pacman -Qqdt) 
alias paf = pacman -F 
alias pafl = pacman -Fl 
alias pau = sudo pacman -Syu 
alias par = sudo pacman -Rns 

# paru
alias prs = paru -S 
alias prss = paru -Ss 
alias prssq = paru -Ssq 
alias prsi = paru -Si 
alias prq = paru -Q 
alias prqi = paru -Qi 
alias prqs = paru -Qs 
alias prqqs = paru -Qqs 
alias prr = paru -Rns 

# systemd
alias sss = sudo systemctl start  
alias sdr = sudo systemctl daemon-reload 
alias ssr = sudo systemctl restart  
alias ssa = systemctl status  
alias sse = sudo systemctl enable  
alias ssd = sudo systemctl disable 
alias ssen = sudo systemctl enable --now 
alias ssdn = sudo systemctl disable --now 
alias sst = sudo systemctl stop  
alias blc = bluetoothctl connect  
alias sch = systemctl hibernate 
alias scs = systemctl suspend 
alias sct = systemctl cat 

alias sua = systemctl --user status 
alias suss = systemctl --user start 
alias sust = systemctl --user stop 
alias sur = systemctl --user restart 
alias sudr = systemctl --user daemon-reload 
alias sue = systemctl --user enable 
alias suen = systemctl --user enable --now 
alias suct = systemctl --user cat 
