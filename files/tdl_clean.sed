/<table.*searchResult/,/<\/table>/{
  /<thead>/,/<\/thead>/d
  /<tr.*>/,/<\/tr>/{    
    H # append to the hold
    x # exchange
    s/\(.*\)\n\(.*\)/\1\2/g
    s/\t/ /g
    s/  */ /g
    x # exchange after removing the new line
    /<\/tr>/{
      x
      /magnet/{		          
        s/<\/tr>//g
		s/.*detName.*<a.*>\(.*\).*<\/a>.*\("magnet[^"]*"\).*"right">\([^<]*\)<.*"right">\([^<]*\)<.*/\1\|\2|\3\|\4/g		
        p 
      }
      d
      x
    }
  }
}



