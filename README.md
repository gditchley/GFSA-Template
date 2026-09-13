# GFSA-Template

A LaTeX template for engineering homework and problem write-ups in **GFSA** form: **Given**, **Find**, **Solution**, and **Answer**.

The format is a standard way to present an engineering problem so a reader can see what was known, what was asked, how it was solved, and what the final result is. This template turns that structure into environments in `gfsa.cls` so each problem is written the same way and typeset consistently.

## What it is for

Use this template when you need a clean, repeatable write-up of worked engineering problems—course homework, recitation solutions, or a set of example problems in a report.

It is not a general essay or lab-report class. It is for problems that break naturally into:

| Section | Purpose |
| --- | --- |
| **Given** | Restate the known data, conditions, and sketches. |
| **Find** | State the unknowns to be determined. |
| **Solution** | Show assumptions, governing equations, algebra, substitutions, and units. |
| **Answer** | Report the final result with symbol, value, and units. |

Each problem lives in its own `.tex` file. `main.tex` is the document that loads the class and inputs those files.

## How a document is built

1. `main.tex` starts the document and loads `gfsa.cls`.
2. Class options `10pt`, `11pt`, or `12pt` set the body size. The matching file in `fonts/` then defines `\tiny` through `\Huge` from that size.
3. Each problem file in `problems/` uses the `problem`, `given`, `find`, `solution`, and `answer` environments from `gfsa.cls`.
4. `main.tex` pulls a problem in with `\input{problems/<name>.tex}`.
5. Figures used in a problem or in `main.tex` go in `images/`.

A problem file is a fragment. It must not contain `\documentclass` or `\begin{document}`.

```latex
\documentclass[11pt]{gfsa}

\begin{document}
\input{problems/sample-problem.tex}
\end{document}
```

```latex
\begin{problem}[Short title]
\begin{given}
% known values and statements
\end{given}

\begin{find}
% quantities to determine
\end{find}

\begin{solution}
% working
\end{solution}

\begin{answer}
% final result with units
\end{answer}
\end{problem}
```

## Layout

| Path | Role |
| --- | --- |
| `gfsa.cls` | Document class and GFSA environments |
| `main.tex` | Compile this file |
| `problems/` | One GFSA problem per `.tex` file |
| `images/` | Figures |
| `fonts/` | `10pt` / `11pt` / `12pt` size-option files |

## Compiling

Compile `main.tex` with pdfLaTeX (or latexmk) from the project root. Auxiliary files such as `.aux` and `.log` stay on your machine; `.gitignore` keeps them out of GitHub. The compiled PDF is local unless you choose to commit it.

## License

MIT. See `LICENSE`.
