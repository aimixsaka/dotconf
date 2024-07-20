# functions
fn elv-reload {
  exec /bin/elvish -rc $E:HOME/.config/elvish/rc.elv
}

fn proxy-set-env {
    |protocol ip port|

    set-env http_proxy $protocol"://"$ip":"$port
    set-env HTTP_PROXY $protocol"://"$ip":"$port
    set-env https_proxy $protocol"://"$ip":"$port
    set-env HTTPS_PROXY $protocol"://"$ip":"$port
    set-env term_proxy_status "on"
}

fn proxy {
    |switch
    &protocol=http
    &port=2842
    &ip=127.0.0.1|

    if (eq $switch on) {
      proxy-set-env $protocol $ip $port
    } elif (eq $switch off) {
      unset-env http_proxy
      unset-env HTTP_PROXY
      unset-env https_proxy
      unset-env HTTPS_PROXY
      set-env term_proxy_status "off"
    } elif (eq $switch status) {
      echo "status: "(if (has-env term_proxy_status) { put $E:term_proxy_status } else { put off })
    } elif (eq $switch v2raya) {
      set ip = 192.168.1.1
      proxy-set-env $protocol $ip $port
    } else {
      echo "Unknown option: "$switch
    }
}

