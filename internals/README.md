# Internals

Intrinsics describing inner working of parts of this "collection".


## Defile project

`defile` - working name for the project as well as for the main command that drives it. The project is centered around the idea of consolidating all shell related information in one place with the main command being used to query it.

This central shell information database would be a database of terms and their descriptions (definitions, explanations) relevant to shell environment and initially focused on the bash shell.

The command `defile` (other candidates: def, re, about) would be used to query the definitions.

A definition of a term `TERM` is comprised of a file `TERM.md`, which would contain:
- metadata as front matter
- term name
- term description
- markdown format can be approximated using ANSI escape sequences
