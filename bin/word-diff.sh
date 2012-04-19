#see purpose of this script at:
#http://stackoverflow.com/questions/7542543/use-gits-word-diff-for-latex-files
#!/bin/sh 
git --no-pager diff --color-words "$2" "$5"
exit 0
