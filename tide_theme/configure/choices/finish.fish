function finish
    _title 'Overwrite tide config?'

    _option y 'Yes'
    printf '%b' '\n\n'

    _option n 'No'
    printf '%b' '\n\n'

    switch (_menu 'Choice' y/n)
        case y

            set -U tide_right_prompt_items 'status' 'cmd_duration' 'context' 'jobs'
            if test -z $tide_time_format
                set -a tide_right_prompt_items 'time'
            end

            set -l vars tide_{ \
                newline, \
                left_prompt_items, \
                prompt_connection_color, prompt_connection_icon, \
                time_format, \
            }

            for var in $vars
                set -l fakeVar "fake_$var"
                set -U $var $$fakeVar
            end
        case n
    end

    _quit
end