\ttfamily\scriptsize
\begin{struktogramm}(140,32)
\wenndann{4}{6}{current == null}
	\wenndann{7}{3}{first == null}
	  \anweisung{node = new Node}
	  \anweisung{first = node}
	  \anweisung{last = node}
	\change
		%empty
	\ifend
\change
	\anweisung{node = new Node}
	\wenndann{5}{5}{current == first}
	  \anweisung{node.setNext(first)}
	  \anweisung{first = node}
	\change
	  \anweisung{prev = getPrevious(current)}
		\anweisung{node.setNext(current)}
	  \anweisung{prev.setNext(node)}
  \ifend
\ifend
\end{struktogramm}
