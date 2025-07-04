# use other modules
use readline-binding
use str

use user-alias
use user-functions
use user-env
use user-packages

each {|c| # this adds function names from module to REPL, from Kurtis
    var code = 'edit:add-var '$c' $mod:'$c
    eval &ns=(ns [&mod:=$user-functions:]) $code 
} [proxy~ elv-reload~]

keys $user-alias: | each {|cmd|
  if (and (not (str:has-prefix $cmd '-')) (str:has-suffix $cmd '~')) {
    var code = 'edit:add-var '$cmd' $mod:'$cmd
    eval &ns=(ns [&mod:=$user-alias:]) $code
  }
}

# setup prompt
set edit:prompt = { styled '('(str:replace '/home/aimi' '~' (pwd))')' '#00AFFC' bold; styled "\nλ " '#5FD700' bold }
set edit:rprompt = { (constantly (styled (whoami)@(cat /etc/hostname)' ' '#B9AD87' bold)); styled (date +%H:%M:%S) '#425D5D' bold }

user-functions:proxy on
