# tree

tree(1)

## .INFO FILES

The `.info` files are similiar to `.gitignore` files - if such a file is found 
while scanning a dir, it is read and added to a stack of `.info` information.

An .info file may contain comments (hash char), or wild-card patterns that may 
match a file relative to the dir the `.info` file is in. If an .info file 
matches a pattern, a TAB indented comment that follows the pattern is used as 
the file comment. A comment is terminated by a non-TAB indented line. 
Multiple patterns, each to a line, may share the same comment.


## FILES

- /etc/DIR_COLORS                 System color database.
- ~/.dircolors                    Users color database.
- .gitignore                      Git exclusion file
- $GIT_DIR/info/exclude           Global git file exclusion list
- .info                           File comment file
- /usr/share/finfo/global_info    Global file comment file

## ENVIRONMENT

### Own env vars
- TREE_COLORS     Uses this for color information over LS_COLORS if it is set.
- TREE_CHARSET    Character set for tree to use in HTML mode.
- CLICOLOR        Enables colorization even if TREE_COLORS or LS_COLORS is not set.
- CLICOLOR_FORCE  Always enables colorization (effectively -C)

### Consulted env vars
- LS_COLORS       Color information created by dircolors
- LC_CTYPE        Locale for filename output.
- LC_TIME         Locale for timefmt output, see strftime(3).
- TZ              Timezone for timefmt output, see strftime(3).
- STDDATA_FD      Enable the *stddata feature*, optionally set descriptor to use.

