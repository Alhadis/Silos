/*
    D20 modern spell hooking script to instigate consequences to the use of
    psionic powers.

    Created VanyaMia for concept by Valas, Feb 2010

    This code runs when any psionic power or spell is actioned and if the area flag NoWarp is not set
*/

#include "X2_I0_SPELLS"
#include "NW_I0_SPELLS"
#include "x2_inc_switches"
#include "_mdrn_const"

void esdamage(location lCaster, effect eLink, float fDelay, float fTime, int nSaveDC)

{
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE,RADIUS_SIZE_COLOSSAL,lCaster,FALSE,OBJECT_TYPE_CREATURE);
    while(GetIsObjectValid(oTarget))
    {
        //always acid damage
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_ACID_S),oTarget));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(d6(3),DAMAGE_TYPE_ACID),oTarget));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_LIGHTNING_M),oTarget));
        if(!MySavingThrow(SAVING_THROW_REFLEX,oTarget,nSaveDC,SAVING_THROW_TYPE_ELECTRICITY))
        {
            // * if they fail the saving throw, they suffer Electrical damage and stunned too
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(d6(6),DAMAGE_TYPE_ELECTRICAL),oTarget));
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLink,oTarget,RoundsToSeconds(2)));
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE,RADIUS_SIZE_COLOSSAL,lCaster,FALSE,OBJECT_TYPE_CREATURE);;
        if (GetTimeMinute()*60.0+GetTimeSecond()<fTime + RoundsToSeconds(10))
            DelayCommand(RoundsToSeconds(2),esdamage(lCaster,eLink,fDelay,fTime,nSaveDC));
    }
}

void main()
{
    //check if a null effect area and if so halt script
    if (GetLocalInt(GetArea(OBJECT_SELF),"NoPerils")!=1)
        return;

    if (d10()==10) //only a 10% anything happens at all
    {
        //on 10 as a result the psionic use causes some effect
        string sName = GetLocalString(OBJECT_SELF, "sPowername");
        location lCaster = GetLocation(OBJECT_SELF);
        int nLevel = GetLocalInt(OBJECT_SELF, "nPerilLevel");
        int nResult;
        //if the power is low level lets not have them die too easily when being cautious
        if (nLevel <= 0)
            nResult = Random(40)+1;  //nothing that deals damage
        else if (nLevel = 2)
            nResult = Random(65)+1;  //some of these are inconvenient
        else if (nLevel = 3)
            nResult = Random(75)+1;  //more chance of getting hurt
        else nResult = d100(); //all bets are off
        int nDamage;
        float fDelay;
        //create creature for announcement
        object oVoice = CreateObject(OBJECT_TYPE_CREATURE,"DMFI_Voice",lCaster);

        //action the roll result
        if (nResult<=10)
        {
            //1-10:Warp echo - screaming sound plays
            AssignCommand(oVoice,SpeakString("As warp energy is drawn any sound gives a violent echo.",TALKVOLUME_SHOUT));
            PlaySound("as_pl_x2screamf3");
        }
        else if (nResult<=20)
        {
            //11-20:Ethereal stench - gas aoe (stinking cloud)
            effect eAOE = EffectAreaOfEffect(AOE_MOB_TYRANT_FOG,"NW_S1_Stink_A");
            AssignCommand(oVoice,SpeakString("As warp energy is drawn the air around becomes noxious.",TALKVOLUME_SHOUT));
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,eAOE,lCaster,RoundsToSeconds(2));
        }
        else if (nResult<=30)
        {
            //21-30:The earth protests (earthquake spell)
            AssignCommand(oVoice,SpeakString("As warp energy is drawn the very earth itself protests.",TALKVOLUME_SHOUT));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(356),OBJECT_SELF,RoundsToSeconds(6));
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE,RADIUS_SIZE_COLOSSAL,lCaster,FALSE,OBJECT_TYPE_CREATURE);
            while (GetIsObjectValid(oTarget))
            {
                //Get the distance between the explosion and the target to calculate delay
                fDelay = GetDistanceBetweenLocations(lCaster,GetLocation(oTarget))/20;
                //Calculate damage
                nDamage = d6(nLevel);
                nDamage = GetReflexAdjustedDamage(nDamage,oTarget,nSaveDC,SAVING_THROW_TYPE_ALL);
                if(nDamage > 0)
                {
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING), oTarget));
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEAD_NATURE), oTarget));
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE,RADIUS_SIZE_COLOSSAL,lCaster,FALSE,OBJECT_TYPE_CREATURE);
            }
        }
        else if (nResult<=40)
        {
            //31-40:Psi discharge (call lightning spell)
            AssignCommand(oVoice,SpeakString("As warp energy is drawn static electricity fills the air.",TALKVOLUME_SHOUT));
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE,RADIUS_SIZE_HUGE,lCaster,FALSE,OBJECT_TYPE_CREATURE);
            while (GetIsObjectValid(oTarget))
            {
                fDelay = GetRandomDelay(0.4, 1.75);
                //Calculate damage
                nDamage = d6(nCasterLvl);
                nDamage = GetReflexAdjustedDamage(nDamage,oTarget,nSaveDC,SAVING_THROW_TYPE_ELECTRICITY);
                //Set the damage effect
                if(nDamage > 0)
                {
                    // Apply effects to the currently selected target.
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL), oTarget));
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oTarget));
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE,RADIUS_SIZE_HUGE,lCaster,FALSE,OBJECT_TYPE_CREATURE);
            }
        }
        else if (nResult<=50)
        {
            //41-50:Banshee howl (wail of the banshee spell)
            AssignCommand(oVoice,SpeakString("As warp energy is drawn a violent scream chills you to your very soul.",TALKVOLUME_SHOUT));
            float fTargetDistance;
            int nCnt = 1;
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_WAIL_O_BANSHEES),lCaster);
            //First the caster - make a fortitude save to avoid death
            if(!MySavingThrow(SAVING_THROW_FORT,OBJECT_SELF,nSaveDC,SAVING_THROW_TYPE_DEATH))
            {
                //Apply the delay VFX impact and death effect
                ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DEATH),OBJECT_SELF);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(),OBJECT_SELF);
            }
            //Get the closest target from the spell target location
            object oTarget = GetNearestObjectToLocation(OBJECT_TYPE_CREATURE,lCaster,nCnt);
            while (nCnt < nCasterLvl)
            {
                fDelay = GetRandomDelay(3.0, 4.0);
                fTargetDistance = GetDistanceBetweenLocations(GetSpellTargetLocation(),GetLocation(oTarget));
                //Check that the current target is valid and closer than 10.0m
                if(GetIsObjectValid(oTarget) && fTargetDistance <= 10.0)
                {
                    //Make a fortitude save to avoid death
                    if(!MySavingThrow(SAVING_THROW_FORT,oTarget,nSaveDC,SAVING_THROW_TYPE_DEATH))
                    {
                        //Apply the delay VFX impact and death effect
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DEATH),oTarget));
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(),oTarget));
                    }
                }
                else
                {
                    //Kick out of the loop
                    nCnt = nCasterLvl;
                }
                //Increment the count of creatures targeted
                nCnt++;
                //Get the next closest target in the spell target location.
                oTarget = GetNearestObjectToLocation(OBJECT_TYPE_CREATURE,lCaster,nCnt);
            }
        }
        else if (nResult<=60)
        {
            //51-60:Spectral gale - wind blows and knockdown unless reflex save on everyone in area
            AssignCommand(oVoice,SpeakString("As warp energy is drawn a gale blows madly.",TALKVOLUME_SHOUT));
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE,RADIUS_SIZE_COLOSSAL,lCaster,FALSE,OBJECT_TYPE_CREATURE);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SOUND_BURST),lCaster);
            while (GetIsObjectValid(oTarget))
            {
                fDelay = GetDistanceBetweenLocations(lCaster,GetLocation(oTarget))/20;
                if(!MySavingThrow(SAVING_THROW_REFLEX,oTarget,nSaveDC))
                {
                    // Apply effects to the currently selected target.
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectKnockdown(),oTarget,5.0));
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE,RADIUS_SIZE_HUGE,lCaster,FALSE,OBJECT_TYPE_CREATURE);
            }
        }
        else if (nResult<=70)
        {
            //61-70:Warp burn - explosion (fireball spell) and stun the psycher(will save to stun the others within radius of the psycher)
            AssignCommand(oVoice,SpeakString("As warp energy is drawn the excess lashes out violently at all.",TALKVOLUME_SHOUT));
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE,RADIUS_SIZE_LARGE,lCaster,FALSE,OBJECT_TYPE_CREATURE);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_FIREBALL),lCaster);
            while(GetIsObjectValid(oTarget))
            {
                nDamage = d6(nCasterLvl);
                nDamage = GetReflexAdjustedDamage(nDamage,oTarget,nSaveDC,SAVING_THROW_TYPE_FIRE);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_IMP_STUN),oTarget,RoundsToSeconds(4));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectStunned(),oTarget,RoundsToSeconds(4));
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(nDamage,DAMAGE_TYPE_FIRE),oTarget));
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_FLAME_M),oTarget));
                oTarget = GetNextObjectInShape(SHAPE_SPHERE,RADIUS_SIZE_LARGE,lCaster,FALSE,OBJECT_TYPE_CREATURE);
            }
        }
        else if (nResult<=80)
        {
            //71-80:Dark summoning - summons a hostile lessor demon for 10 rounds
            AssignCommand(oVoice,SpeakString("As warp energy is drawn a daemon breaches the barrier.",TALKVOLUME_SHOUT));
            object oDaemon = CreateObject(OBJECT_TYPE_CREATURE,"DH_INCARNLESS",lCaster);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2),GetLocation(oDaemon));
            DelayCommand(RoundsToSeconds(10)-0.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2),GetLocation(oDaemon)));
            DestroyObject(oDaemon,RoundsToSeconds(10));
        }
        else if (nResult<=90)
        {
            //81-90:Blood rain - turn the area red and make it rain 10 rounds
            AssignCommand(oVoice,SpeakString("As warp energy is drawn blood rains from the sky.",TALKVOLUME_SHOUT));
            object oArea = GetArea(OBJECT_SELF);
            effect eLink = EffectLinkEffects(EffectVisualEffect(VFX_IMP_PULSE_NEGATIVE),EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_EVIL));
            int nWeather = GetWeather(oArea);
            eLink = EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_LIGHT_RED_20));
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,eLink,lCaster,RoundsToSeconds(10));
            SetWeather(oArea,WEATHER_RAIN);
            DelayCommand(RoundsToSeconds(10),SetWeather(oArea,nWeather));
        }
        else if (nResult<=95)
        {
            //91-95:ethereal storm - druid acid rain storm centered on psycher
            AssignCommand(oVoice,SpeakString("As warp energy is drawn an ethereal storm breaks out.",TALKVOLUME_SHOUT));
            effect eLink = EffectLinkEffects(EffectStunned(),EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED));
            float fDelay = GetRandomDelay(0.5, 2.0);
            float fTime = GetTimeMinute()*60.0+GetTimeSecond();
            //this bit does the visual effect
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_STORM),lCaster);
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,EffectAreaOfEffect(AOE_PER_STORM,"****","****","****"),lCaster,RoundsToSeconds(10));
            eLink = EffectLinkEffects(eLink,EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
            DelayCommand(RoundsToSeconds(1),esdamage(lCaster,eLink,fDelay,fTime,nSaveDC));
        }
        else
        {
            //96-100: Daemonhost - the psycher becomoes possessed by a major demon (psyker is teleported elsewhere, stunned, damaged to 1 hp) a hostile major demon is spawned in place of the psyker.
            AssignCommand(oVoice,SpeakString("As warp energy is drawn a daemon possesses the psyker.",TALKVOLUME_SHOUT));
            object oDaemon = CreateObject(OBJECT_TYPE_CREATURE,"DH_GREATDAEM1",lCaster);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE),GetLocation(oDaemon));
            ActionJumpToObject(GetObjectByTag("wp_daemonhost"),FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(GetCurrentHitPoints(OBJECT_SELF)-1),OBJECT_SELF);
            DelayCommand(RoundsToSeconds(10)-0.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2),GetLocation(oDaemon)));
            DelayCommand(RoundsToSeconds(10)-0.25,ActionJumpToObject(oDaemon,FALSE));
            DestroyObject(oDaemon,RoundsToSeconds(10));
        }
        //destroy announcement creature
        DestroyObject(oVoice);
    }
}
