#  append the lookup table
s/$/A.-B-...C-.-.D-..E.F..-.G--.H....I..J.---K-.-L.-..M--N-.O---P.--.Q--.-R.-.S...T-U..-V...-W.--X-..-Y-.--Z--..1.----2..---3...--4....-5.....6-....7--...8---..9----.0----- \/\//

#  lookup the key (digit) and replace with the value
s/\(.\).*\1\([^A-Z0-9]*\).*/\2/
