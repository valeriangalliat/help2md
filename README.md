# help2md [![npm version](http://img.shields.io/npm/v/help2md.svg?style=flat-square)](https://www.npmjs.org/package/help2md)

> Convert command help string to Markdown.

Usage
-----

```sh
# Show markdown equivalent of help text.
some-program --help | help2md

# Output a new readme, with newly generated help between
# `<!-- BEGIN USAGE -->` and `<!-- END USAGE -->` tags.
some-program --help | help2md-tags README.md

# Modify readme in place with new help between tags (like above).
some-program --help | help2md-in-place README.md
```

Examples
--------

See the [tests](test) for example parsing.

You can also look [gogs-migrate's makefile](https://github.com/valeriangalliat/gogs-migrate/blob/master/Makefile)
which is using help2md to update it's readme in place.
