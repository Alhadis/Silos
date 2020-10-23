\ttfamily\scriptsize
\begin{struktogramm}(140,32)
\wenndann{1}{6}{current == null || first == null}
	%empty
\change
	\wenndann{3}{5}{current == first}
	  \anweisung{first = first.getNext()}
	\change
	  \anweisung{prev = getPrevious(current)}
	  \wenndann{6}{2}{current == last}
	  	\anweisung{last = prev}
	  \change
	  	%empty
	  \ifend
		\anweisung{next = current.getNext()}
	  \anweisung{prev.setNext(next)}
	  \anweisung{current = next}
  \ifend
\ifend
\end{struktogramm}
