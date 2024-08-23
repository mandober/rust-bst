# def

`def` (working name) is a command that looks up the definition (i.e. explanation) of the argument.

The concept is one of flat file lookups. There is a dir containing one file per definition.

A *definition* consists of a *definiendum*, the term, and *definiens*, the explanation.

Definition files, one per definition, are located in a predefined directory.

This command, `def NAME`, looks up the file `NAME.md` in the definitions dir and displays its contents if found, e.g. `def command` would look up the file named `command.md` in the $DEFDIR directory.

Forming the filename:
- convert NAME to lowercase
- attach .md extension
- prepend the dir path to it
- lookup the file
- display its contents if found

Formatting a definition
- format the definiendum as title (white on green or orange)
- format the definiens as body text

## Variables
- *definition* consists of
- *definiendum* - the term
- *definiens* - the explanation
- `$DEFDIR` - the directory with definition files
- `$NAME` - the def to look up
- *definition file*, a markdown (text) file named after the definiendum.

## Definition files

A definition file whould be a markdown file, so there is a rudimentary text formatting that can be given some styling when it is displayed in the terminal. This would need *bash markdown parser*.

*Front matter*: it would be nice to have a front matter section to hold all the metadata related to the file/definition.

An example of a def file:

```md
name: command
group: general
meta: special-envar, bash-var
---
Command
A **command** is either an *external* or *internal* procedure.
```

## Metadata

Front Matter key/value pairs
