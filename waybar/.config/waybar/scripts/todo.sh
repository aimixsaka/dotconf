#!/usr/bin/bash

TODO_FILE="$HOME/workspace/todo.txt"
COUNT=$(wc -l < $TODO_FILE)
TODOS=$(cat $TODO_FILE | head -c -1 - | sed -z 's/\n/\\n/g')
printf '{"text": "%s", "tooltip": "%s"}\n' "$COUNT" "$TODOS"
