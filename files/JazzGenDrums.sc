/*	
====================================================================================
2011 | Jonathan Baker  | JazzGen  |  http://www.jonny-baker.com | http://github.com/JSBaker

All source code licenced under The MIT Licence
====================================================================================  
*/

+ JazzGen {

jazzDrums {

	{
		(8*tempMult).do{arg dc;//drum counter
	//					"drums: ".post;
	//					probs[dc][2].postln;
		
		
		if(solo<0,{
		drumWait = drumTimes[dc];
		
			if((tempoChange&&dc==0)||(dc==0&&barCount==0)||tempoEnd,{splashPat.value(0,drumTimes[dc],0.8);tempoEnd=false});
	
				patIndex = (((probs[dc][2]/1))*3).floor;//.postln;
				
				// change pattern from swing if tempo increase
				if((bps>0.59)&&(tempoChange)&&(patIndex==2),{patIndex=1});
				
				ridePat.value(patIndex,drumTimes[dc]);
				
				if((dc%2)==0,{
				
					if((probs[dc][2].coin)||(dc==0),{
					
						kickPat.value(patIndex,drumTimes[dc]);
					})
					},{
					
						hatPat.value(drumTimes[dc]);
					
						if((probs[dc][2].sqrt).coin,{
						
						snarePat.value(patIndex,drumTimes[dc]);
						splash = splash*(1+probs[dc][2]);
						//splash.postln;
						if((splash.coin), {
							if((probs[dc][2].coin)&&(patIndex==1),{
								splashPat.value(0,drumTimes[dc]);
								splash=0.01;
						
							})});
						});
					});
	
		},{
		sc = dc/2; 
		drumWait = drumSoloTimes[sc]*0.5;
		
			if(solo==2,{
				//calculate individual score for solo
				ds = (1.0-(scores[0]/gaussianThresh));
				
				trip = ((1.0-((min(bps,0.7)-0.38)/0.3201)).squared);
				
				if(dc%2==0,{
					
					if((trip.coin)&&(currentSolo>3),{	
							snarePat.value(currentSolo,(drumSoloTimes[sc]*0.5),true,soloistAmp);
							kickPat.value(currentSolo,(drumSoloTimes[sc]*0.5),true,soloistAmp);
							ridePat.value(currentSolo,(drumSoloTimes[sc]*0.5),true,soloistAmp);
	//										if((dc==0)||ds.coin,{
	//											splashPat.value([0,1,2,3].wchoose(splashWeights[currentSolo]),(drumSoloTimes[sc]*0.5),rrand(0.8,1.1),soloistAmp);
	//										});
							quickFill = true;
	//										(drumSoloTimes[sc]*0.5).wait;
	//										snarePat.value(currentSolo,(drumSoloTimes[sc]*0.5),true,soloistAmp);
	//										kickPat.value(currentSolo,(drumSoloTimes[sc]*0.5),true,soloistAmp);
	//										ridePat.value(currentSolo,(drumSoloTimes[sc]*0.5),true,soloistAmp);
						},{
							snarePat.value(currentSolo,drumSoloTimes[sc],true,soloistAmp);
							kickPat.value(currentSolo,drumSoloTimes[sc],true,soloistAmp);
							ridePat.value(currentSolo,drumSoloTimes[sc],true,soloistAmp);
					
					
					if((dc==0)||ds.coin,{
						
						splashPat.value([0,1,2,3].wchoose(splashWeights[currentSolo]),drumSoloTimes[sc],rrand(0.8,1.1),soloistAmp);
						});
					});
					
					if(quickFill==false,{currentSolo = [0,1,2,3,4,5,6].wchoose(drumSoloWeights[currentSolo])});	
					},{
					hatPat.value((drumSoloTimes[sc]*0.5));
					
					if(quickFill,{
						snarePat.value(currentSolo,(drumSoloTimes[sc]*0.5),true,soloistAmp);
						kickPat.value(currentSolo,(drumSoloTimes[sc]*0.5),true,soloistAmp);
						ridePat.value(currentSolo,(drumSoloTimes[sc]*0.5),true,soloistAmp);
						if((dc==0)||ds.coin,{
							splashPat.value([0,1,2,3].wchoose(splashWeights[currentSolo]),(drumSoloTimes[sc]*0.5),rrand(0.8,1.1),soloistAmp);
						});
						currentSolo = [0,1,2,3,4,5,6].wchoose(drumSoloWeights[currentSolo]);
						quickFill = false;
					});
						
						
				})
			},{
			
			//============= Drums Accompaniment ========================
			
				//ds = (1.0-(scores[0]/gaussianThresh));
				
				// occasionally switch to skippy beat if high score
				patIndex = if((dc%3==0)&&(probs[dc][2].squared.coin),{patIndex=2},{patIndex=0});
				
				// occasionally play splash on first beat if high score
				if((dc==0&&barCount==0)||(dc==0&&probs[dc][2].squared.coin),{splashPat.value(0,drumTimes[dc],rrand(0.75,0.85),0.5)});
				
				if(dc%2==0,{
					if((dc==0),{
						kickPat.value(patIndex,drumSoloTimes[sc],true,soloAcAmp);
						ridePat.value(patIndex,drumSoloTimes[sc],true,soloAcAmp);
						},{
							if(probs[dc][2].squared.coin,{
								if((dc>5)&&(probs[dc][2].squared.coin),{snarePat.value(patIndex,drumSoloTimes[sc],true,soloAcAmp)});
								ridePat.value(patIndex,drumSoloTimes[sc],true,soloAcAmp);
							})
						})
					},{
					if(probs[dc][2].coin,{hatPat.value(drumSoloTimes[sc]*0.5,soloAcAmp)});
				})
				
			})	
		});
		drumWait.wait;
		}
	}.fork(tempo);


	}


}