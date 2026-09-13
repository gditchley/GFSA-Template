# problems

Individual engineering problems for the GFSA template.

Each `.tex` file in this folder is one problem written with the environments defined in `gfsa.cls`:

- `problem`
- `given`
- `find`
- `solution`
- `answer`

These files are fragments, not stand-alone documents. Compile from the project root with `main.tex`, which inputs a problem file:

```latex
\input{problems/sample-problem.tex}
```

## Conventions

- One problem per file.
- Use a descriptive file name (`beam-deflection.tex`), not a generic name like `problem1.tex`.
- Do not include `\documentclass`, `\usepackage`, `\begin{document}`, or `\end{document}` here. Those belong only in `main.tex`.
- Put figures in `images/` and reference them from the problem file.

## Skeleton

```latex
\begin{problem}[Short title]
\begin{given}
% restated data, sketches, and known values
\end{given}

\begin{find}
% quantities to determine
\end{find}

\begin{solution}
% assumptions, governing equations, algebra, and substitutions
\end{solution}

\begin{answer}
% final result with symbol, value, and units
\end{answer}
\end{problem}
```

This README keeps the folder in Git when no problem files have been added yet.
