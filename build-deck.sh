#!/usr/bin/env bash

folder_containing_source_files_for_slides=markdown-slides
target_file=how-i-employ-and-expand-on-david-agans-9-debugging-rules-to-try-to-repair-anything.md

filenames_of_slides=(
  00--deckset-configuration-commands.md
  01--title.md
  02--introduction.md
  03--topics.md
  04--who-am-i.md
  05--rule--understand-the-system.md
  06--rule--make-it-fail.md
  07--rule--quit-thinking-and-look.md
  08--rule--divide-and-conquer.md
  09--rule--change-one-thing-at-a-time.md
  10--rule--keep-an-audit-trail.md
)

cat_command="cat "

for slide in "${filenames_of_slides[@]}"; do
  cat_command="${cat_command}$folder_containing_source_files_for_slides/$slide "
done

cat_command="${cat_command} > $target_file"

eval "$cat_command"

open $target_file -a /Applications/Deckset.app/
