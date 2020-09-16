.flash name="vlternate-simple-viewer.swf" background=white version=6 compress
    
# A variant on the simple viewer   
#
# Author: Cameron Bracken 
# cameron.bracken@gmail.com
#
# LICENSE:
#
#   viewer.sc is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#

    
#create button pieces
    .box b_hover width=40 height=40 fill=gray
    
    .outline play_outline:    
       M 25 , 12.5 L 0 , 0 L 0 , 25 L 25 , 12.5
    .end
    
    .outline stop_outline:
        M 0,0 L 0,25  L 5,25  L 5,0  L 0,0
        M 10,0 L 10,25 L 15,25 L 15,0 L 10,0 
    .end
    
    .outline next_outline:
        M 0,0  L 0,20  L 15,10 L 0,0
        M 15,0 L 15,20 L 30,10 L 15,0
    .end 
    
    .outline back_outline:
        M 0,10  L 15,20  L 15,0 L 0,10
        M 15,10 L 30,20 L 30,0 L 15,10
    .end
    
    .filled play_img outline=play_outline color=black fill=#B0C4DE line=2 
    .filled stop_img outline=stop_outline color=black fill=#B0C4DE line=2
    .filled next_img outline=next_outline color=black fill=#B0C4DE line=2
    .filled back_img outline=back_outline color=black fill=#B0C4DE line=2


#group next button pieces
    .button play
        .show b_hover as=area
        .show play_img as=idle 
        .show play_img as=shape
        .show play_img as=pressed 
        .show play_img alpha=50% as=hover 
        #ActionScript
        .on_press:
            myplay();
        .end
    .end

#group next button pieces
    .button stop
        .show b_hover as=area
        .show stop_img as=idle 
        .show stop_img as=shape
        .show stop_img as=pressed 
        .show stop_img alpha=50% as=hover 
        #ActionScript
        .on_press:
            mystop();
        .end
    .end

#group next button pieces
    .button next
        .show b_hover as=area
        .show next_img as=idle 
        .show next_img as=shape
        .show next_img as=pressed 
        .show next_img alpha=50% as=hover 
        #ActionScript
        .on_press:
            mynext();
        .end
    .end

#group back button pieces
    .button back
        .show b_hover as=area
        .show back_img as=idle
        .show back_img as=shape
        .show back_img as=pressed
        .show back_img alpha=50% as=hover
        #ActionScript
        .on_press:
            myback();
        .end
    .end

#viewport
    .sprite viewport 
        # slave movie goes here
    .end

    .action:

        _root.createEmptyMovieClip("viewport");

        viewport.stop();
        viewport.pause();
         
        
        function mynext() {
            viewport.nextframe();
        }

        function myback() {
            viewport.prevframe();
        }

     
        function myplay(){
            viewport.play();
        }
        
        function mystop(){
            viewport.stop();
        }
        
        function mygoto(){
            clearinterval(idinterval);
            viewport.gotoAndstop(textvar);
        }



    .end

#Draw everything
    .put viewport
    .put b1=play x=30 y=30 pin=center
    .put b2=stop x=70 y=30 pin=center
    .put b3=back x=100 y=35 pin=center
    .put b4=next x=140 y=35 pin=center


.end
