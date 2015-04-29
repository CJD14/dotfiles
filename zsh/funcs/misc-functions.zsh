# a visual recursive list of all files and dirs
function treedir()
  {
    find . | sed -e 's/[^\/]*\//|--/g' -e 's/-- |/    |/g' | $PAGER
  }

# recursive text search
function f() {
  find . | sed -e 's/[^\/]*\//|--/g' -e 's/-- |/  |/g' | $PAGER
}

# recursive search and replace ignores hidden files and dirs/ ex. replace foo bar
function replace() {
  find . \( ! -regex '.*/\..*' \) -type f | xargs perl -pi -e "s/$1/$2/g"
}

