[General]
title=start
id=001

[Content]
Hello  {{player_name}}! now, it is time to begin. Wake up, hero! Cogiton Ergosum
Cogito Ergosum
Cogito Ergosum

[Dependencies]
start.sc

[Choices]
Hello hello.sc
Run run.sc

# Exemples de syntaxe :
# file = scene1.sc
# [Dependencies]
# scene2.sc
#
# scene2.sc will be loaded with scene1.sc
# choices will be combined
#
# In dependencies and choices :
# if BOOLEAN: scene3.sc
# if BOOLEAN: "Choice" scene3.sc
# have <item_name>: scene4.sc
# is <state_name>: scene5.sc
# if in the bool table BOOLEAN is TRUE, add choice or load scene
#
