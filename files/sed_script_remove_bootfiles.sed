
# print everything up to the project files
/^<BEGIN> PROJECT_FILES/ ! {
   p
   d
}

:c

# after the end of the project files, go on printing everything
/<END>/ {
   p
   d
}

# within the project files, print if not matching hirschmann
/hirschmann/ ! {
   p
}

# next line and back to :c
n
bc



