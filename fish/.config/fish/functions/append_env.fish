function append_env --description 'Append a new value to a PATH like environment variable if not exists' --argument env values
    if test (count $env) -gt 0
        for value in $values
            if not contains $value $$env
                set -gx --path -a $env $value
            end
        end
    else
        set -gx --path $env $values
    end
end
