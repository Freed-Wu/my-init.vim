\@ifundefined{NeedsTeXFormat}{% 2.09 version
\def\filename{%FILE%.sty}
\def\filedate{%DATE%}
\def\fileversion{0.1}
\typeout{Package: `%FILE%' \fileversion\space <\filedate>}
}{% 2e version
\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{%FILE%}[%DATE% v0.1 %HERE%]
\LoadClass{}
}

\endinput
