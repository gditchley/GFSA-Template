# font-size

Class option files that set the document’s type size for `gfsa.cls`.

The only class options in this folder are the body-text sizes:

- `10pt`
- `11pt`
- `12pt`

Choose one in `main.tex`:

```latex
\documentclass[11pt]{gfsa}
```

That option sets `\normalsize` to 10, 11, or 12 point. The matching option file then defines the rest of the standard LaTeX size commands relative to that body size:

`\tiny` · `\scriptsize` · `\footnotesize` · `\small` · `\normalsize` · `\large` · `\Large` · `\LARGE` · `\huge` · `\Huge`

Only one of `10pt`, `11pt`, or `12pt` should be given. These files do not select a typeface; they only scale the size commands.

This README keeps the folder in Git when no option files have been added yet.
