function touchf
    if  test (count $argv) -ne 1
        echo "Need exactly one argument"
        exit 1
    else if ! test -e $argv[1]
         set dir (dirname $argv[1])
        if ! test -d $dir
            install -d $dir
        end
        touch $argv[1]
    end
end
