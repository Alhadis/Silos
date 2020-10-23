// Template for On Module Load event
#include "inc_persistworld"
#include "inc_lock"
#include "inc_trap"
#include "inc_doppelganger"
#include "inc_debug_dac"
#include "x2_inc_switches"
void main()
{
   //debugVarObject("mod_onmodload", OBJECT_SELF);

   // Standard On Module Load events
   ExecuteScript("x2_mod_def_load", OBJECT_SELF);
   ExecuteScript("prc_onmodload", OBJECT_SELF);

   // Respawnable PRGT traps, see trap_readme.nss from CEP
   ExecuteScript("trap_on_load", OBJECT_SELF);

   object oMod = GetModule();

   // Use custom Soulknife "Shape Mindblade" feat -- see psi_sk_shmbld.nss
   SetLocalInt(oMod, "SOULKNIFE_CUSTOM_MINDBLADE_SHAPES", 1);

   /////////////////////////////////////////////////////////////////////////////
   // Persistent World settings
   // Item/Placeable setting overrides Area setting, which overrides Module setting

   // Respawn placeables, relock & retrap doors after this many rounds
   SetLocalInt(oMod, VAR_RESPAWN_TIME, 10);
   // Spawn placeable guardians this percent of the time
   SetLocalInt(oMod, VAR_GUARD_CHANCE, 10);
   // Lock and/or trap doors and containers this percent of the time
   SetLocalInt(oMod, VAR_LOCK_CHANCE, 50);
   SetLocalInt(oMod, VAR_TRAP_CHANCE, 25);
   // How often to save PC data?
   SetLocalInt(oMod, VAR_PC_SAVE_DELAY, 300); // seconds
   // What percent of "helpless captives" are actually doppelgangers?
   SetLocalInt(oMod, VAR_DOPPELGANGER_CHANCE, 5);

   /////////////////////////////////////////////////////////////////////////////
   // Database settings
   //SetLocalInt(oMod, "PRC_USE_DATABASE", TRUE);
   //SetLocalInt(oMod, "PRC_DB_SQLLITE", FALSE);
   //SetLocalInt(oMod, "PRC_DB_MYSQL", TRUE);
   // ODBC Database connectivity
   SQLInit();
   testODBC();

   // This will precache 2da files into the database.
   // The first time a module runs with this set it will lag a lot for a
   // long time as the game does 2da reads.
   // Afterwards it will be much faster.
   // This is a really, really long lag. Like days/weeks type length.
   // This is not the "normal" precaching that the spellbooks & psionics does.
   //SetLocalInt(oMod, "PRC_DB_PRECACHE", FALSE);

   /////////////////////////////////////////////////////////////////////////////
   // PrC Settings - these are my preferences; see personal_switch.nss

   // Bioware True Seeing can see stealthed creatures.
   // This replaces the trueseeing effect with a See Invisible + Ultravision +
   // Spot bonus.  This affects the spell and power True Seeing and the Dragon
   // Disciple class.
   SetLocalInt(oMod, "PRC_PNP_TRUESEEING", TRUE);

   // PRC_PNP_TRUESEEING must be on.
   // Value of spot skill bonus that True Seeing grants.
   // Defaults to +15 if not set.
   //SetLocalInt(oMod, "PRC_PNP_TRUESEEING_SPOT_BONUS", 15);

   // Remove the cap PRC added to these spells
   SetLocalInt(oMod, "PRC_BIOWARE_GRRESTORE", TRUE);
   SetLocalInt(oMod, "PRC_BIOWARE_HEAL", TRUE);
   SetLocalInt(oMod, "PRC_BIOWARE_MASS_HEAL", TRUE);
   SetLocalInt(oMod, "PRC_BIOWARE_HARM", TRUE);
   SetLocalInt(oMod, "PRC_BIOWARE_NEUTRALIZE_POISON", TRUE);
   SetLocalInt(oMod, "PRC_BIOWARE_REMOVE_DISEASE", TRUE);

   // Timestop has Bioware durations (9 seconds or 18 for Greater Timestop)
   // rather than PnP durations (1d4+1 or 2d4+2)
   //SetLocalInt(oMod, "PRC_TIMESTOP_BIOWARE_DURATION", FALSE);

   // Timestop has only a local affect, i.e doesn't stop people on the other
   // areas of the module.  Note that AOEs continue to act during a timestop,
   // and durations/delayed events still occur.
   SetLocalInt(oMod, "PRC_TIMESTOP_LOCAL", TRUE);;

   // PRC_TIMESTOP_LOCAL must be enabled.
   // Caster can't perform any hostile actions while in timestop.
   //SetLocalInt(oMod, "PRC_TIMESTOP_NO_HOSTILE", FALSE);

   // PRC_TIMESTOP_LOCAL must be enabled.
   // PCs can't see anything while stopped.
   // This might look to the player like their game crashed.
   //SetLocalInt(oMod, "PRC_TIMESTOP_BLANK_PC", FALSE);

   // Instead of Bioware's sequential summons it creates multiple elementals.
   // Only works if PRC_MULTISUMMON is on
   SetLocalInt(oMod, "PRC_PNP_ELEMENTAL_SWARM", TRUE);

   // If you pass a save, you can't be affected by that aura for 24h.
   // NOTE: Not implemented yet
   SetLocalInt(oMod, "PRC_PNP_FEAR_AURAS", TRUE);

   // Not a polymorph but ability bonuses instead.
   SetLocalInt(oMod, "PRC_PNP_TENSERS_TRANSFORMATION", TRUE);

   // Less powerful, more PnP accurate version.
   // Caster must concentrate to maintain it.
   //SetLocalInt(oMod, "PRC_PNP_BLACK_BLADE_OF_DISASTER", FALSE);

   // Traps are only shown, not disarmed
   //SetLocalInt(oMod, "PRC_PNP_FIND_TRAPS", FALSE);

   // PnP Darkness
   // Is a mobile AOE based off an item
   SetLocalInt(oMod, "PRC_PNP_DARKNESS", TRUE);

   // Bioware Invisibility, Improved Invisibility
   //SetLocalInt(oMod, "PRC_BIOWARE_INVISIBILITY", FALSE);

   // 3.5ed Darkness
   // Gives 20% concelement rather than bioware darkness
   //SetLocalInt(oMod, "PRC_PNP_DARKNESS_35ED", FALSE);

   // Undead summons are permanent, but can only have 4HD/casterlevel in total
   // Does not enforce the requirement for a corpse
   // Also applies to ghoul gauntlet which otherwise will create one ghoul
   // if you don't already have a summon
   SetLocalInt(oMod, "PRC_PNP_ANIMATE_DEAD", TRUE);

   // "Word of Faith" spells use 3.5 ed rules rather than 3.0ed
   // basically instead of 12+ / <12 / <8 / <4 its relative to caster level
   // at >=CL / <CL / <CL-5 / <CL-10
   // This basically makes it more powerful at higher levels
   SetLocalInt(oMod, "PRC_35ED_WORD_OF_FAITH", TRUE);

   // Undead created by Create Undead and Create Greater Undead are
   // not automatically under the casters control
   // If this is set, the undead are permanently created
   //SetLocalInt(oMod, "PRC_CREATE_UNDEAD_UNCONTROLLED", FALSE);

   // Undead created by Create Undead and Create Greater Undead are
   // not removed on resting etc
   SetLocalInt(oMod, "PRC_CREATE_UNDEAD_PERMANENT", TRUE);

   // Sleep and Deep Slumber dont have a limit on the
   // HD of a target to be effected.
   SetLocalInt(oMod, "PRC_SLEEP_NO_HD_CAP", TRUE);

   // By request, set this to use the 1.65 behaviour for implosion, phantasmal
   // killer and weird, i.e. death immunity counts
   // This is in addition to the extra immunities 1.66 adds
   SetLocalInt(oMod, "PRC_165_DEATH_IMMUNITY", TRUE);

   // This switch toggles whether items are destroyed by Claws of the Bebilith
   // or simply unequipped.
   SetLocalInt(oMod, "PRC_BEBILITH_CLAWS_DESTROY", TRUE);

   // When on, unidentified items will automatically by identified when aquired
   // respecting normal lore skill rules.
   //SetLocalInt(oMod, "PRC_AUTO_IDENTIFY_ON_ACQUIRE", FALSE);

   // When on, identified items will automatically by unidentified when aquired
   // provided the new owner is not a friend/neutral and not to/from a store
   //SetLocalInt(oMod, "PRC_AUTO_UNIDENTIFY_ON_UNACQUIRE", FALSE);

   // Extra damage switch for Apocalypse from the Sky
   // spell does 10d6 by default, 40d4 with this set
   SetLocalInt(oMod, "PRC_AFTS_EXTRA_DAMAGE", TRUE);


   // Switch whether unlearning spells for spont casters at level up should go
   // according to PnP or Bioware rules.  If on, will unlearn according to
   // Bioware rules (e.g. as many as you want).
   SetLocalInt(oMod, "PRC_BIO_UNLEARN", TRUE);

   // This turns on the new improved imbue arrow functionality so all the
   // player has to do is cast the spell at an arrow in their inventory.
   // If this is off, players get the default bioware imbue arrow as a
   // bonus feat on their hides.
   SetLocalInt(oMod, "PRC_USE_NEW_IMBUE_ARROW", TRUE);

   // If this is set, the Dragon Disciple size increases at level 15 and 25
   // will give ability increases matching the new size
   // In any case, DDs will benefit from increased natural damage
   SetLocalInt(oMod, "PRC_DRAGON_DISCIPLE_SIZE_CHANGES", TRUE);

   //   Start of samurai switches
   // This values are divided by 100 when applied so a value of 100 is
   // equivalent to 1.0
   // This allows samurai to sacrifice stolen items
   SetLocalInt(oMod, "PRC_SAMURAI_ALLOW_STOLEN_SACRIFICE", TRUE);

   // This allows samurai to sacrifice unidentified items
   // They will get full value for them however
   //SetLocalInt(oMod, "PRC_SAMURAI_ALLOW_UNIDENTIFIED_SACRIFICE", FALSE);

   // This scales the value of sacrificed items.
   // This values are divided by 100 when applied so a value of 100 is
   // equivalent to 1.0
   //SetLocalInt(oMod, "PRC_SAMURAI_SACRIFICE_SCALAR_x100", 100);

   // This scales the maximum value a samurai can have.
   // This values are divided by 100 when applied so a value of 100 is
   // equivalent to 1.0
   //SetLocalInt(oMod, "PRC_SAMURAI_VALUE_SCALAR_x100", 100);

   //  Normally, some bans on itemproperties are setup automatically.
   //  If this switch is set, then nothing is banned automatically
   //  thus giving admins full controll.
   //SetLocalInt(oMod, "PRC_SAMURAI_DISABLE_DEFAULT_BAN", FALSE);

   // Orc Warlord gets a single additional cohort that must be an orc of some
   // sort instead of multiple summons.
   //SetLocalInt(oMod, "PRC_ORC_WARLORD_COHORT", FALSE);

   // Disables the Lichs Alter Self ability
   // This was original a fudge for the HotU fairy/wolf/elemental quest
   //SetLocalInt(oMod, "PRC_LICH_ALTER_SELF_DISABLE", FALSE);

   // Reduces the True Necromancers aura visual effects
   // It continues to function the same though
   //SetLocalInt(oMod, "PRC_TRUE_NECROMANCER_ALTERNATE_VISUAL", FALSE);

   // Thrallherd uses leadership system rather than its own summons
   // They still cannot use Leadership, Epic Leadership or Legendary Commander feats
   SetLocalInt(oMod, "PRC_THRALLHERD_LEADERSHIP", FALSE);

   // Prevents Spellfire wielders from absorbing their own spells/powers
   //SetLocalInt(oMod, "PRC_SPELLFIRE_DISALLOW_CHARGE_SELF", FALSE);

   // Prevents Spellfire channelers from absorbing from scrolls/potions
   //SetLocalInt(oMod, "PRC_SPELLFIRE_DISALLOW_DRAIN_SCROLL_POTION", FALSE);

   // Disables the PRCs sorcerer newspelbook extension
   SetLocalInt(oMod, "PRC_SORC_DISALLOW_NEWSPELLBOOK", TRUE);

   // Disables the PRCs bards newspelbook extension
   SetLocalInt(oMod, "PRC_BARD_DISALLOW_NEWSPELLBOOK", TRUE);

   // By default, CW Samurai get a plain katana and a plain wakizashi
   // (shortsword) at 1st level.
   // Setting this to non-zero value prevents that.
   //SetLocalInt(oMod, "PRC_CWSAMURAI_NO_HEIRLOOM_DAISHO", FALSE);

   // Determines the number of wight henchmen a Soul Eater can have via their
   // Soul Slave class ability.
   // Default: 4
   // Special: Due to it not being possible to differentiate between a set 0
   //          and an unset 0, to prevent any wight henchmen, set the switch
   //          to -1. (0 counts as the default)
   //SetLocalInt(oMod, "PRC_SOUL_EATER_MAX_SLAVES", 4);

   // Disable players selecting templates via PRC Options convo
   //SetLocalInt(oMod, "PRC_DISABLE_CONVO_TEMPLATE_GAIN", FALSE);

   // Epic Spells

   // If set, then the switches below will not be set to default values.
   // Should be used if any customisation is done.
   SetLocalInt(oMod, "PRC_EPIC_INGORE_DEFAULTS", TRUE);

   // Do epic spells cost XP to cast?
   // Defaults to: TRUE
   //SetLocalInt(oMod, "PRC_EPIC_XP_COSTS", TRUE);

   // Do casters take 10 when researching?
   // Defaults to: FALSE
   SetLocalInt(oMod, "PRC_EPIC_TAKE_TEN_RULE", TRUE);

   // Use caster's primary ability (divine casters Wis, arcane Int/Cha
   // as appropriate)
   // Defaults to: FALSE
   SetLocalInt(oMod, "PRC_EPIC_PRIMARY_ABILITY_MODIFIER_RULE", TRUE);

   // Do epic spells do backlash damage if specified in the spell?
   // Defaults to: TRUE
   //SetLocalInt(oMod, "PRC_EPIC_BACKLASH_DAMAGE", TRUE);

   // Do school foci change the research and casting DC?
   // Defaults to: TRUE
   //SetLocalInt(oMod, "PRC_EPIC_FOCI_ADJUST_DC", TRUE);

   // DC multiplier for gold to research.
   // Defaults to: 9000 as per PnP
   SetLocalInt(oMod, "PRC_EPIC_GOLD_MULTIPLIER", 1000);

   // Amount the researched spell's gold cost is divided by to get it's XP cost.
   // Defaults to: 25
   SetLocalInt(oMod, "PRC_EPIC_XP_FRACTION", 100);

   // Proportion of research gold is lost in a failed attempt. The full cost is
   // divided by this value to get the amount lost.
   // Defaults to: 2 (i.e half)
   //SetLocalInt(oMod, "PRC_EPIC_FAILURE_FRACTION_GOLD", 2);

   // Probablity out of 100 of seeds being destroyed when learnt.
   // Defaults to: 50
   //SetLocalInt(oMod, "PRC_EPIC_BOOK_DESTRUCTION", 50);

   // 100% immunity and 20h duration instead of 50% and casterlevel+10 rounds.
   SetLocalInt(oMod, "PRC_PNP_UNIMPINGED", TRUE);

   // 100% immunity and 20h duration instead of 50% and casterlevel+10 rounds.
   SetLocalInt(oMod, "PRC_PNP_IMPENETRABILITY", TRUE);

   // 100% immunity and 20h duration instead of 50% and casterlevel+10 rounds.
   SetLocalInt(oMod, "PRC_PNP_DULLBLADES", TRUE);

   // 20h instead of rounds per level
   SetLocalInt(oMod, "PRC_PNP_CHAMPIONS_VALOR", TRUE);

   // Disable learning epic spells via the PRC OPtions Convo
   // Does not need PRC_EPIC_INGORE_DEFAULTS to be set
   //SetLocalInt(oMod, "PRC_EPIC_CONVO_LEARNING_DISABLE", FALSE);

   // Spells cast from magic staffs use the wielder's casterlevel rather than
   // the item's if the wielder's casterlevel is higher.
   // This makes magic staffs more valuable to mages, especially at high levels.
   SetLocalInt(oMod, "PRC_STAFF_CASTER_LEVEL", TRUE);

   // NPCs go through spellhooking as if they are PCs.
   //SetLocalInt(oMod, "PRC_NPC_HAS_PC_SPELLCASTING", FALSE);

   // Stops players banking loads of XP without leveling by using the level they
   // would have with their current XP instead of whatever their level is.
   //SetLocalInt(oMod, "PRC_ECL_USES_XP_NOT_HD", FALSE);

   // Stops demilich, i.e. Lich class has only 4 levels
   SetLocalInt(oMod, "PRC_DISABLE_DEMILICH", FALSE);

   // Defines the possible uses of the Epic Spell Laboratory. Values as follows:
   // 0 = (default) Can teleport to the Epic Spell Laboratory, merchant sells
   //     all epic spells and new wizard scrolls.
   // 1 = Can teleport to the Epic Spell Laboratory, merchant sells only the
   //     epic spells available in HotU and new wizard scrolls.
   // 2 = Can teleport to the Epic Spell Laboratory, but the merchant is
   //     unavailable.
   // 3 = Cannot teleport to the Epic Spell Laboratory.
   //SetLocalInt(oMod, "PRC_SPELLSLAB", 0);

   // Disables the sale of scrolls from the epic spell laboratory.
   //SetLocalInt(oMod, "PRC_SPELLSLAB_NOSCROLLS", FALSE);

   // Makes reaching 0 in an ability score have the special effects it should
   // have according to PnP.
   // @see inc_abil_damage.nss
   SetLocalInt(oMod, "PRC_PNP_ABILITY_DAMAGE_EFFECTS", TRUE);

   // Turns on the included version of supply based rest by demitious
   // See inc_sbr_readme.nss for details
   //SetLocalInt(oMod, "PRC_SUPPLY_BASED_REST", FALSE);

   // Characters only gain a number of hitpoints equal to their level from
   // resting.
   SetLocalInt(oMod, "PRC_PNP_REST_HEALING", FALSE);

   // Resting causes game time to advance.
   // See inc_time.nss for details
   //SetLocalInt(oMod, "PRC_PNP_REST_TIME", TRUE);

   // Wizards use PnP spellschools instead of Bioware's
   // They must be generalists, but there is no way to enforce that
   // If letoscript is enabled, then all wizards will be set to PnP
   // Spellschool as their school plus the ConvoCC will set it if this
   // switch is on
   //SetLocalInt(oMod, "PRC_PNP_SPELL_SCHOOLS", FALSE);

   // Players have a variable tracking how far ahead of the module clock
   // they are and when all players are ahead, the module clock advances to
   // catch up.
   // This includes 8 hours when resting and time spent crafting
   // See inc_time for implementation
   SetLocalInt(oMod, "PRC_PLAYER_TIME", TRUE);

   // You must have at least 1 hand free to cast spells with somatic components.
   // This means at most a small shield in the off hand and
   // no dual wielded weapons, though ranged and doublehanded are OK.
   //SetLocalInt(oMod, "PRC_PNP_SOMATIC_COMPOMENTS", FALSE);

   // You must have at least 1 hand free to use items that you do not have
   // equipped.
   // This means at most a small shield in the off hand and
   // no dual wielded weapons, though ranged and doublehanded are OK.
   //SetLocalInt(oMod, "PRC_PNP_SOMATIC_ITEMS", FALSE);

   // Second or subsequent summons don't destroy the first.
   // Can cause lag with high numbers of summons and/or tight spaces
   SetLocalInt(oMod, "PRC_MULTISUMMON", TRUE);

   // Summons last for a number of rounds equal to caster level, rather than
   // 24h or other timings
   //SetLocalInt(oMod, "PRC_SUMMON_ROUND_PER_LEVEL", FALSE);

   // Familiars follow PnP rules rather than Bioware's.
   // This makes them a lot weaker and less suited for combat.
   // Includes bonded summoner familiars.
   //SetLocalInt(oMod, "PRC_PNP_FAMILIARS", FALSE);

   // This disables the ability to heal Bioware familiars by feading them
   // through the conversation
   //SetLocalInt(oMod, "PRC_PNP_FAMILIAR_FEEDING", FALSE);

   // This disables the 2 free spells wizards get at levelup.
   // The GUI still shows, but it does nothing or rather its effects are
   // undone afterwards.
   // It requires letoscript to work.
   // not implemented yet
   //SetLocalInt(oMod, "PRC_NO_FREE_WIZ_SPELLS", FALSE);

   // Sets the behaviour of the PRC Power Attack. Set this to either
   // PRC_POWER_ATTACK_DISABLED or PRC_POWER_ATTACK_FULL_PNP if you give
   // it a value.
   // Default: One cannot use a higher power attack setting than one could using
   //          Bioware Power Attack. ie, if one possessed PA, but not IPA, one
   //          can only use PA up to 5. And up to 10 with IPA.
   // @see PRC_POWER_ATTACK_DISABLED
   // @see PRC_POWER_ATTACK_FULL_PNP
   //SetLocalInt(oMod, "PRC_POWER_ATTACK", 1);

   // A possible value of PRC_POWER_ATTACK.
   // If this is used, PRC Power Attack is completely disabled. The feats will
   // not be granted to players and even if they somehow gain access to the
   // feats, they will have no effect.
   // @see PRC_POWER_ATTACK
   //const int PRC_POWER_ATTACK_DISABLED = -1;

   // A possible value of PRC_POWER_ATTACK.
   // If this is used, PRC Power Attack behaves as the Pen and Paper version.
   // This means ability to sacrifice any amount of attack bonus, up to one's
   // BAB. The existence of Bioware IPA is ignored as a limiting factor, only
   // normal Power Attack is required.
   // @see PRC_POWER_ATTACK
   //const int PRC_POWER_ATTACK_FULL_PNP = 1;

   // Sets the behaviour of the PRC Power Attack.
   // If this is set, the Bioware Power Attack modes are included in the
   // calculation against the characters BAB limit.
   // Default: PRC Power Attack ignores whether BW Power Attack is active
   // or not, which may result in the character paying a total amount of
   // AB greater than their BAB.
   SetLocalInt(oMod, "PRC_POWER_ATTACK_STACK_WITH_BW", TRUE);

   // Setting this will stop the GUI automatically appearing when a player is
   // petrified on hardcore.
   // You can use a script named "prc_pw_petrific" which will always be run at
   // petrification (regardless of this switch) on hardcore to pop up the GUI
   // as you want it, rather than being forced to use biowares.
   SetLocalInt(oMod, "PRC_NO_PETRIFY_GUI", TRUE);

   // Set this to remove the switch changing convo feat.
   // This should be set for PWs to avoid players screwing around with switches
   // A value of zero allows anyone to change switches
   // A value of 1 allows only DMs to change switches
   // Any other value prohibits everyone from changing switches
   SetLocalInt(oMod, "PRC_DISABLE_SWITCH_CHANGING_CONVO", 1);

   // Set this to remove checks to enforce domains
   // e.g. Fire Genasi dont have to take the Fire domain, etc
   //SetLocalInt(oMod, "PRC_DISABLE_DOMAIN_ENFORCEMENT", FALSE);

   // Set this to remove replace bioware HolyAvenger itemproperties
   // with PnP HolyAvenger itemprperties instead
   // (for paladins, +5 +2d6 divine vs evil, castspel:dispel magic @
   // casterlevel = paladinlevels)
   // (for non paladins, +2)
   SetLocalInt(oMod, "PRC_PNP_HOLY_AVENGER_IPROP", TRUE);

   // Set this to enable the permanent death and XP cost functionality
   // of Necrotic Termination spell.
   SetLocalInt(oMod, "PRC_NEC_TERM_PERMADEATH", TRUE);

   // Set this to enable alignment changes for the casting of spells with
   // the Evil/Good descriptor.
   SetLocalInt(oMod, "PRC_SPELL_ALIGNMENT_SHIFT", TRUE);

   // Set this to give a number of Free cohorts as with leadership
   // This can be used to simulate a party of players
   // Unlike normal cohorts, those granted through this switch
   // do not have the -2 level lag.
   //SetLocalInt(oMod, "PRC_BONUS_COHORTS", FALSE);

   // Disable the use of custom cohorts
   //SetLocalInt(oMod, "PRC_DISABLE_CUSTOM_COHORTS", FALSE);

   // Disable the use of standard cohorts
   //SetLocalInt(oMod, "PRC_DISABLE_STANDARD_COHORTS", FALSE);

   // Disable registration of custom cohorts
   //SetLocalInt(oMod, "PRC_DISABLE_REGISTER_COHORTS", FALSE);

   // Gives all slings equiped Mighty +20 for free
   // Simulates PnP rules where you can add strength to damage
   SetLocalInt(oMod, "PRC_PNP_SLINGS", TRUE);

    // Applies speed increase/decrease effects
    // Simulates PnP rules where different races have different speeds
   SetLocalInt(oMod, "PRC_PNP_RACIAL_SPEED", TRUE);

   // Applys speed increase/decrease effects
   // Simulates PnP rules where different armors have different speeds
   // Medium armor is a 25% speed reduction, Heavy is a 33% reduction
   SetLocalInt(oMod, "PRC_PNP_ARMOR_SPEED", TRUE);

   // by Bioware rules, PCs have approximatly a 7th faster movement than NPCs
   // so they can outrun them quite easily.
   // This switch removes that so they are on even footings.
   SetLocalInt(oMod, "PRC_REMOVE_PLAYER_SPEED", TRUE);

   // Enforces racial appearance as defined in racialtypes.2da
   SetLocalInt(oMod, "PRC_ENFORCE_RACIAL_APPEARANCE", FALSE);

   // By default, on acquire script for races only runs for NPCs if they have
   // a PC as a master.
   // This runs it for all NPCs, note this will take significantly more CPU
   // time.
   //SetLocalInt(oMod, "PRC_NPC_FORCE_RACE_ACQUIRE", FALSE);

   // By default, if you acquire a pre-1.68 cloak it will be randomly recolored
   // so that it doesn't look beiger than beige.  This disables that if you
   // really want beige cloaks for some reason.
   //SetLocalInt(oMod, "PRC_DYNAMIC_CLOAK_AUTOCOLOUR_DISABLE", FALSE);

   // disable all the appearance-changing options on the PRC OPtions convo
   //SetLocalInt(oMod, "PRC_APPEARNCE_CHANGE_DISABLE", FALSE);

   // Death system

   // Turns on the PRC PnP Bleeding & Death system
   // see prc_inc_death for details
   // NOTE: This will only work if the module has no other scripts for
   // OnPlayerDying and OnPlayerDeath events. Otherwise those will interfere
   // with this system.
   SetLocalInt(oMod, "PRC_PNP_DEATH_ENABLE", TRUE);

   // If zero, don't bleed just die.
   // By PnP rules this would be 1 round, or 6 seconds.
   //SetLocalInt(oMod, "PRC_DEATH_TIME_BETWEEN_BLEEDING", 60);

   // If zero, dont stabilize.
   // By PnP rules this would be 1 hour, or 2 minutes/120 seconds by default
   // NWN settings.
   //SetLocalInt(oMod, "PRC_DEATH_TIME_BETWEEN_STABLE", 120);

   // If zero, don't disable.
   // By PnP rules this would be 1 day, or 48 minutes/2880 seconds by default
   // NWN settings.
   //SetLocalInt(oMod, "PRC_DEATH_TIME_BETWEEN_DISABLED", 2880);

   // This is the checks-once-dead for raising.
   //SetLocalInt(oMod, "PRC_DEATH_TIME_BETWEEN_DEATH", 0);

   // Damage when bleeding
   // By PnP, this would be 1
   //SetLocalInt(oMod, "PRC_DEATH_DAMAGE_FROM_BLEEDING", 1);

   // Damage when stable
   // By PnP, this would be 1
   //SetLocalInt(oMod, "PRC_DEATH_DAMAGE_FROM_STABLE", 1);

   // Healing when bleeding
   // By PnP, this would be 0
   //SetLocalInt(oMod, "PRC_DEATH_HEAL_FROM_STABLE", 0);

   // % chance to improve when bleeding
   // By PnP, this would be 10
   //SetLocalInt(oMod, "PRC_DEATH_BLEED_TO_STABLE_CHANCE", 10);

   // % chance to resume bleeding when stable
   // By PnP, this would be 0
   //SetLocalInt(oMod, "PRC_DEATH_STABLE_TO_BLEED_CHANCE", 0);

   // % chance to improve when stable
   // By PnP, this would be 10
   //SetLocalInt(oMod, "PRC_DEATH_STABLE_TO_DISABLED_CHANCE", 10);

   // ACP switches

   // This is a set of settings for Ragnaroks Alternate Combat animations Pack (ACP)
   // Main hak:
   // http://nwvault.ign.com/View.php?view=hakpaks.Detail&id=5895
   // CEP heads:
   // http://nwvault.ign.com/View.php?view=hakpaks.Detail&id=5934
   // CEP robes:
   // http://nwvault.ign.com/View.php?view=hakpaks.Detail&id=5950
   // (credit to USAgreco66kg for those CEP files)
   // Note on haks: You should NOT add the acp_2da hak if you have the
   // PRC installed.
   // Plus, once you press the OK button to add the ACP haks, make sure
   // you press cancel as soon as it appears. Otherwise, the toolset will crash
   // as it tries to compile the PRC scripts.
   // If you are using CEP2, then you only need ragnaroks main package.
   // Compatible robes and heads are included within CEP2.
   // As of NWN v1.67 there is no need to press the cancel button as the toolset
   // no longer attempts to compile scripts in haks.

   // Set this to give players radial feats to change combat animations
   SetLocalInt(oMod, "PRC_ACP_MANUAL", TRUE);

   // Set this so that players will change combat animations automatically
   // based on weapons equiped and class
   SetLocalInt(oMod, "PRC_ACP_AUTOMATIC", FALSE);

   // Set this so that NPCs will change combat animations automatically
   // based on weapons equiped and class
   // This can either be set on the module for a global setting
   // or set on individual NPCs for specific individuals
   SetLocalInt(oMod, "PRC_ACP_NPC_AUTOMATIC", TRUE);

   // Set this for a number of minutes delay betwen changing animations
   // This is useful to stop people spamming the server with changes
   // If not set, it defaults to 90 seconds. To set to zero, set var to -1
   SetLocalInt(oMod, "PRC_ACP_DELAY", 10);

   // Poison system switches

   // If this is set, uses the last three characters from the item's tag
   // instead of the local variable 'pois_idx' to define the poison the item
   // represents. The value is used as an index to poison.2da.
   SetLocalInt(oMod, "USE_TAGBASED_INDEX_FOR_POISON", FALSE);

   // Number of times the poisoned item works. Or if
   // PRC_USES_PER_ITEM_POISON_DIE is set, the number of dice rolled to
   // determine it. Should be at least 1 if set.
   // Default: 1
   SetLocalInt(oMod, "PRC_USES_PER_ITEM_POISON_COUNT", 1);

   // Size of dice used to determine number of times the poisoned item works.
   // Value should be at least 2.
   // If value is less than 2, the die roll is skipped.
   // Default: No dice are rolled.
   SetLocalInt(oMod, "USES_PER_ITEM_POISON_DIE", 4);

   // If this is nonzero, only weapons that do slashing or piercing damage
   // are allowed to be poisoned.
   // Default: All weapons can be poisoned.
   //SetLocalInt(oMod, "PRC_ALLOW_ONLY_SHARP_WEAPONS", FALSE);

   // If this is nonzero, inhaled and ingest poisons may be placed on weapons in
   // addition to contact and injury poisons.
   // Default: Only contact and injury poisons are allowed on weapons.
   //SetLocalInt(oMod, "PRC_ALLOW_ALL_POISONS_ON_WEAPONS", FALSE);

   // If this is nonzero, a DEX check is rolled against Handle_DC in
   // the poison's column in poison.2da.
   // Possessing the Use Poison feat will always pass this check..
   // Default: A static 5% failure chance is used, as per the DMG.
   SetLocalInt(oMod, "PRC_USE_DEXBASED_WEAPON_POISONING_FAILURE_CHANCE", TRUE);

   // Number of hits the poison will function on the weapon. Or if
   // PRC_USES_PER_WEAPON_POISON_DIE is set, the number of dice rolled.
   // If this is set, the value should be >= 1.
   // Default: 1
   SetLocalInt(oMod, "PRC_USES_PER_WEAPON_POISON_COUNT", 1);

   // Size of the die rolled when determining the amount of hits the poison will
   // work on. If this is set, the value should be at least 2.
   // Default: Dice aren't rolled.
   SetLocalInt(oMod, "PRC_USES_PER_WEAPON_POISON_DIE", 4);

   // This is the name of the script to be run when someone attempts to
   // poison food to check if the targeted item is food. The default script
   // returns FALSE for everything, so you must define your own to have this
   // functionality.
   // Default: poison_is_food <- an example script, just returns false
   // @see poison_is_food
   //SetLocalString(oMod, "PRC_POISON_IS_FOOD_SCRIPT_NAME", "poison_is_food");

   // This switch determines whether a creature equipping a poisoned item
   // is assumed to be acting smartly in that it attempts to clean the item
   // first. If it's not set, the creature just directly equips the item and
   // gets poisoned.
   // Default: Off, the creature gets poisoned without any checks
   // @see poison_onequip
   //SetLocalInt(oMod, "PRC_POISON_ALLOW_CLEAN_IN_EQUIP", FALSE);

   // PRGT system switches

   SetLocalString(oMod, "PRC_PRGT_XP_SCRIPT_TRIGGERED", "trap_on_trigger");
   SetLocalString(oMod, "PRC_PRGT_XP_SCRIPT_DISARMED", "trap_on_disarm");
   SetLocalString(oMod, "PRC_PRGT_XP_SCRIPT_RECOVERED", "trap_on_acquire");

   //SetLocalInt(oMod, "PRC_PRGT_XP_AWARD_FOR_TRIGGERED", 0);
   //SetLocalInt(oMod, "PRC_PRGT_XP_AWARD_FOR_RECOVERED", 0);
   //SetLocalInt(oMod, "PRC_PRGT_XP_AWARD_FOR_DISARMED", 0);

   // Psionics switches

   // If this is set, use ac_appearances.2da to determine an Astral Construct's
   // appearance instead of the values hardcoded into the script.
   SetLocalInt(oMod, "ASTRAL_CONSTRUCT_USE_2DA", TRUE);

   // Setting this switch active makes Psychic Reformation only allow one to
   // reselect psionic powers instead of fully rebuilding their character.
   // Possible values:
   // 0              = Off, Psychic Reformation behaves as specified in the
   //                  power description. That is, the target is deleveled by
   //                  a certain amount and then releveled back to where they
   //                  were.
   // Nonzero, not 2 = On, Psychic Reformation only nulls a selected number of
   //                  the target's selected powers and allows reselection.
   // 2              = On, and the XP cost is reduced to 25 per level reformed.
   //SetLocalInt(oMod, "PRC_PSI_PSYCHIC_REFORMATION_NERF", 0);

   // Determines how Rapid Metabolism works.
   // When set, heals the feat possessor by their Hit Dice + Constitution
   // modifier every 24h.
   // Default: Heals the feat possessor by 1 + their Constitution modifier every
   //          turn (60s).
   //SetLocalInt(oMod, "PRC_PNP_RAPID_METABOLISM", FALSE);

   // Determines how the epic feat Improved Metapsionics works.
   // When set, the total cost of metapsionics applied to power being
   // manifested is summed and Improved Metapsionics cost reduction is applied
   // to the sum.
   // Default: Improved Metapsionics cost reduction is applied separately to
   // each metapsionic used with power being manifested.
   //SetLocalInt(oMod, "PRC_PSI_IMP_METAPSIONICS_USE_SUM", FALSE);

   // PnP Polymorphing switches

   // These switches are used to limit the targets that can be used with the
   // PRC Polymorph / Shifting mechanics.
   // Remember, mimicking uses the targeting instance, whereas
   // shifting into that form again later creates a new instance from
   // the resref. Thus if you modify creatures after they have been
   // placed from the palette, odd things may happen.
   // Also if you give any monster the "Archetypal Form" feat, the players
   // will not be able to take that monsters shape.

   // If set, the system compares user HD to target CR.
   // Default: user HD is compared to target HD
   // Values: 0 is not set, anything else is set.
   //SetLocalInt(oMod, "PNP_SHFT_USECR", FALSE);

   // If set, the system does not allow target creatures of size Huge
   // or greater.
   // Values: 0 is not set, anything else is set.
   //SetLocalInt(oMod, "PNP_SHFT_S_HUGE", FALSE);

   // If set, the system does not allow target creatures of size Large.
   // Values: 0 is not set, anything else is set.
   //SetLocalInt(oMod, "PNP_SHFT_S_LARGE", FALSE);

   // If set, the system does not allow target creatures of size Medium.
   // Values: 0 is not set, anything else is set.
   //SetLocalInt(oMod, "PNP_SHFT_S_MEDIUM", FALSE);

   // If set, the system does not allow target creatures of size Small.
   // Values: 0 is not set, anything else is set.
   //SetLocalInt(oMod, "PNP_SHFT_S_SMALL", FALSE);

   // If set, the system does not allow target creatures of size Tiny
   // or smaller.
   // Values: 0 is not set, anything else is set.
   //SetLocalInt(oMod, "PNP_SHFT_S_TINY", FALSE);

   // If set, the system does not allow target creatures of given type.
   // Values: 0 is not set, anything else is set.
   //SetLocalInt(oMod, "PNP_SHFT_F_OUTSIDER", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_ELEMENTAL", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_CONSTRUCT", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_UNDEAD", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_DRAGON", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_ABERRATION", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_OOZE", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_MAGICALBEAST", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_GIANT", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_VERMIN", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_BEAST", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_ANIMAL", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_MONSTROUSHUMANOID", FALSE);
   //SetLocalInt(oMod, "PNP_SHFT_F_HUMANOID", FALSE);

   // Combat System Switches

   // @TODO: Write description.
   //SetLocalInt(oMod, "PRC_PNP_ELEMENTAL_DAMAGE", FALSE);

   // TODO: Write description.
   //SetLocalInt(oMod, "PRC_SPELL_SNEAK_DISABLE", FALSE);

   // Use 3.5 edition unarmed damage progression instead of 3.0 edition.
   // Default: Use 3.0 unarmed damage progression.
   //SetLocalInt(oMod, "PRC_3_5e_FIST_DAMAGE", FALSE);

   // Use a Brawler character's size as a part of determining their unarmed
   // damage.
   // Default: A Brawler's size is ignored.
   SetLocalInt(oMod, "PRC_BRAWLER_SIZE", TRUE);

   // Use appearance size rather than racial-determined size
   // This also means it includes bonuses from classes and spells
   SetLocalInt(oMod, "PRC_APPEARANCE_SIZE", TRUE);

   // This reenables the Bioware Monk attack progression, with up to 6
   // monk attacks per round.
   SetLocalInt(oMod, "PRC_BIOWARE_MONK_ATTACKS", TRUE);

   // This switch (if on) takes care that only light weapons (one size smaller
   // than the creature size) are finessable, meaning that small races can only
   // finesse tiny weapons.
   SetLocalInt(oMod, "PRC_SMALL_CREATURE_FINESSE", TRUE);

   // turns on combat debugging for scripted combat,
   // similar to Bioware's dm_enablecombatdebugging 1
   // will show a lot of info about the attack and damage rolls
   SetLocalInt(oMod, "PRC_COMBAT_DEBUG", FALSE);

   // switches on Biowares Divine Power version (bonus atacks come at full AB)
   SetLocalInt(oMod, "PRC_BIOWARE_DIVINE_POWER", TRUE);

   // if True, allows us to select a better target in prc combat functions
   // by switching from one target to another (closer) target
   // only relevant for melee combat (we never switch targets on ranged combat)
   SetLocalInt(oMod, "PRC_ALLOW_SWITCH_OF_TARGET", TRUE);

   // disable coup the grace on first attack in round
   //SetLocalInt(oMod, "PRC_DISABLE_COUP_DE_GRACE", FALSE);

   // Limit to the (non-dice) damage of a flame weapon or darkfire spell.
   // If the switch is not set or zero, non-dice damage of flame weapon or
   // darkfire is limited to 10.
   // It is recommended not to set these switches higher than 10.
   //SetLocalInt(oMod, "PRC_FLAME_WEAPON_DAMAGE_MAX", 0);
   //SetLocalInt(oMod, "PRC_DARKFIRE_DAMAGE_MAX", 0);

   // Craft System

   // Completely disable the PRC Crafting System
   //SetLocalInt(oMod, "PRC_DISABLE_CRAFT", FALSE);

   // Disables epic crafting
   //SetLocalInt(oMod, "PRC_DISABLE_CRAFT_EPIC", FALSE);

   // Multiply the delay (in seconds) after the creation of an item in which
   // a PC can't craft anything. This is divided by 100 to get a float.
   // Normally, it's set to the market price of the item. Set
   // it to less than 100 to reduce it instead. (default: 0).
   // This is independant of PRC_PLAYER_TIME.
   //SetLocalInt(oMod, "PRC_CRAFT_TIMER_MULTIPLIER", 0);

   // Absolute maximum delay (in seconds) where crafting is disabled for a PC,
   // regardless of the item's market price. By default it's 0 (meaning that
   // there's no delay at all).
   // This is independant of PRC_PLAYER_TIME.
   //SetLocalInt(oMod, "PRC_CRAFT_TIMER_MAX", 0);

   // Absolute minimum delay (in seconds) where crafting is disabled for a PC,
   // regardless of the item's market price. By default it's 0 (meaning that
   // there's no delay at all).
   // This is independant of PRC_PLAYER_TIME.
   //SetLocalInt(oMod, "PRC_CRAFT_TIMER_MIN", 0);

   // These three switches modify Bioware crafting so that the items produced
   // have the casterlevel of the spellcaster who created them. Normally under
   // Bioware, it is possible for a level 3 caster to produce level 9 items and
   // for a level 40 caster to only produce level 5 items.
   // This also allows metamagic to apply to crafting. i.e you produce a wand
   // of maximized fireball.
   // @see PRC_SCRIBE_SCROLL_CASTER_LEVEL
   // @see PRC_CRAFT_WAND_CASTER_LEVEL
   // @see PRC_BREW_POTION_CASTER_LEVEL
   SetLocalInt(oMod, "PRC_BREW_POTION_CASTER_LEVEL", TRUE);
   SetLocalInt(oMod, "PRC_SCRIBE_SCROLL_CASTER_LEVEL", TRUE);
   SetLocalInt(oMod, "PRC_CRAFT_WAND_CASTER_LEVEL", TRUE);
   // As above, except it applies to staffs
   SetLocalInt(oMod, "PRC_CRAFT_STAFF_CASTER_LEVEL", TRUE);

   // Characters with a crafting feat always have the appropriate base item
   // in their inventory.
   //SetLocalInt(oMod, "PRC_CRAFTING_BASE_ITEMS", FALSE);

   // Max level of spells brewed into potions
   // defaults to 3
   SetLocalInt(oMod, "X2_CI_BREWPOTION_MAXLEVEL", 9);

   // Cost modifier of spells brewed into potions.
   // Defaults to 50
   //SetLocalInt(oMod, "X2_CI_BREWPOTION_COSTMODIFIER", 50);

   // Cost modifier of spells scribed into scrolls.
   // Defaults to 25
   //SetLocalInt(oMod, "X2_CI_SCRIBESCROLL_COSTMODIFIER", 25);

   // Max level of spells crafted into wands
   // defaults to 4
   SetLocalInt(oMod, "X2_CI_CRAFTWAND_MAXLEVEL", 9);

   // Cost modifier of spells crafted into wands.
   // Defaults to 750
   //SetLocalInt(oMod, "X2_CI_CRAFTWAND_COSTMODIFIER", 750);

   // Cost modifier of spells crafted into staffs.
   // Note that adding a second spell costs 75% and 3 or more costs 50%.
   // Defaults to 750
   //SetLocalInt(oMod, "X2_CI_CRAFTSTAFF_COSTMODIFIER", 750);

   // Allows the use of arbitrary itemproperties and uses NWN item costs
   // ie. not PnP
   //SetLocalInt(oMod, "PRC_CRAFTING_ARBITRARY", FALSE);

   // Scales the item costs overall for the purposes of crafting.
   // Defaults to 100
   //SetLocalInt(oMod, "PRC_CRAFTING_COST_SCALE", 100);

   // Scales the item costs for mundane item crafting.
   // Defaults to 100
   //SetLocalInt(oMod, "PRC_CRAFTING_MUNDANE_COST_SCALE", 100);

   // Sets crafting time per 1000gp in market price:
   // 1 - off, no time required
   // 2 - round
   // 3 - turn
   // 4 - hour
   // 5 - day
   // defaults to 1 hour/1000gp
   //SetLocalInt(oMod, "PRC_CRAFTING_TIME_SCALE", 4);

   // Teleport System

   // Defines the maximum number of teleport target locations a PC may store.
   // Default: 50
   //SetLocalInt(oMod, "PRC_TELEPORT_MAX_TARGET_LOCATIONS", 50);

   // If this is set, all spells/powers/effects with the [Teleportation]
   // descriptor (ie, their scripts use GetCanTeleport()) fail.
   // Default: Off
   //SetLocalInt(oMod, "PRC_DISABLE_TELEPORTATION", FALSE);

   // Persistent World switches

   // Persistent time tracking.
   // When the first player logs on, the clock is set forward to the last
   // time that player logged off.
   SetLocalInt(oMod, "PRC_PW_TIME", TRUE);

   // Number of rounds between exporting all characters.
   SetLocalInt(oMod, "PRC_PW_PC_AUTOEXPORT", 10);

   // A player's HP is stored via persistant locals every HB and restored
   // on logon.
   //SetLocalInt(oMod, "PRC_PW_HP_TRACKING", FALSE);

   // A player's location is stored via persistant locals every HB and restored
   // on logon.
   //SetLocalInt(oMod, "PRC_PW_LOCATION_TRACKING", FALSE);

   // Player places map pins are tracked via persistant locals and restored
   // on logon.
   SetLocalInt(oMod, "PRC_PW_MAPPIN_TRACKING", TRUE);

   // Being dead is stored via persistant locals and restored on logon.
   //SetLocalInt(oMod, "PRC_PW_DEATH_TRACKING", FALSE);

   // Spells cast are tracked via persistant locals and restored on logon
   //SetLocalInt(oMod, "PRC_PW_SPELL_TRACKING", FALSE);

   // Players can't logon for this many minutes after a server load.
   SetLocalInt(oMod, "PRC_PW_LOGON_DELAY", 0);

   // XP system

   // This modifies the amount of XP a character receives based on
   // Level Adjustment
   // - Doesn't take racial hit dice into account.
   // - Should work with any prior XP system.
   // - Use this on pre-exisitng modules.
   //SetLocalInt(oMod, "PRC_XP_USE_SIMPLE_LA", FALSE);

   // Any new characters entering the module are automatically given racial
   // hit dice.
   // Unlike PnP, they do not get to select what feats/skills the racial
   // HD grant.
   // Instead the default bioware package will be used.
   // Do not use if the ConvoCCs racial hit dice option is in use.
   //SetLocalInt(oMod, "PRC_XP_USE_SIMPLE_RACIAL_HD", FALSE);

   // Characters must earn their racial HD through the normal levelup process
   // Player must still take all their racial HD before they can take more
   // than one level in a non-racial class.
   // PRC_XP_USE_SIMPLE_RACIAL_HD must be on, and the convoCC racial hit dice
   // option must be off.
   //SetLocalInt(oMod, "PRC_XP_USE_SIMPLE_RACIAL_HD_NO_FREE_XP", FALSE);

   // Characters are given racial HD via LevelupHenchman so can't select
   // feats etc.
   // Uses the default packages for each class, which are poor to say the least
   // PRC_XP_USE_SIMPLE_RACIAL_HD must be on, and the convoCC racial hit dice
   // option must be off.
   //SetLocalInt(oMod, "PRC_XP_USE_SIMPLE_RACIAL_HD_NO_SELECTION", FALSE);

   // Enables PRC XP system.
   // This may cause balance issues with pre-exisiting modules, so it is
   // recommended that only builders use this and do extensive playtesting
   // and tweaking for balance.
   // Uses the dmgxp.2da file which is a copy of the XP tables in the DMG
   // and ELH.  These are based on the formula of 13.3333 encounters of
   // CR = ECL to advance a level.
   // Enconters of CR > ECL+8 or CR < ECL-8 dont give XP.
   // Tables are setup so that parties' levels will converge over time.
   //SetLocalInt(oMod, "PRC_XP_USE_PNP_XP", FALSE);

   // This value is divided by 100 when applied so a value of 100 is
   // equivalent to 1.0.
   // Slider for PnP XP system, multiplier for final XP amount
   // This can also be set on individual PCs for the same result. If it is
   // not set, then it defaults to 1.0. If you want 0.0 then set it to -1.
   //SetLocalInt(oMod, "PRC_XP_SLIDER_x100", 0);

   // Use ECL for NPCs instead of CR.
   // Should be close, but I dont know how Bioware CR calculations work with the
   // PRC races.
   // Also note ECL is a measure of power in a campaign, wheras CR is measure of
   // power in a single encounter. Thus ECL weights use/day abilitieis more than
   // CR does.
   //SetLocalInt(oMod, "PRC_XP_USE_ECL_NOT_CR", FALSE);

   // If this is set, ECL = LA + racial hit dice
   // EVEN IF THE CHARACTER DOESNT HAVE ANY RACIAL HIT DICE!
   // So it penalizes the power races far more than PnP because they don't
   // get any of the other benefits of racial hit dice (BAB, HP, saves,
   // skills, feats, etc).
   //SetLocalInt(oMod, "PRC_XP_INCLUDE_RACIAL_HIT_DIE_IN_LA", FALSE);

   // These values are divided by 100 when applied so a value of 100
   // is equivalent to 1.0.
   // This is for purposes of party size for dividing XP awards by.
   // By PnP only PCs would count, and possibly henchmen too, but you might
   // want to tweak others for balance purposes, for example to hinder a solo
   // wizard with dozens of summons.
   //SetLocalInt(oMod, "PRC_XP_PC_PARTY_COUNT_x100", 100);


   // These values are divided by 100 when applied so a value of 100
   // is equivalent to 1.0.
   // This is for purposes of party size for dividing XP awards by.
   // By PnP only PCs would count, and possibly henchmen too, but you might
   // want to tweak others for balance purposes, for example to hinder a solo
   // wizard with dozens of summons.
   //SetLocalInt(oMod, "PRC_XP_HENCHMAN_PARTY_COUNT_x100", 100);

   // These values are divided by 100 when applied so a value of 100
   // is equivalent to 1.0.
   // This is for purposes of party size for dividing XP awards by.
   // By PnP only PCs would count, and possibly henchmen too, but you might
   // want to tweak others for balance purposes, for example to hinder a solo
   // wizard with dozens of summons.
   //SetLocalInt(oMod, "PRC_XP_DOMINATED_PARTY_COUNT_x100", 100);

   // These values are divided by 100 when applied so a value of 100
   // is equivalent to 1.0.
   // This is for purposes of party size for dividing XP awards by.
   // By PnP only PCs would count, and possibly henchmen too, but you might
   // want to tweak others for balance purposes, for example to hinder a solo
   // wizard with dozens of summons.
   //SetLocalInt(oMod, "PRC_XP_ANIMALCOMPANION_PARTY_COUNT_x100", 100);

   // These values are divided by 100 when applied so a value of 100
   // is equivalent to 1.0.
   // This is for purposes of party size for dividing XP awards by.
   // By PnP only PCs would count, and possibly henchmen too, but you might
   // want to tweak others for balance purposes, for example to hinder a solo
   // wizard with dozens of summons.
   //SetLocalInt(oMod, "PRC_XP_FAMILIAR_PARTY_COUNT_x100", 100);

   // These values are divided by 100 when applied so a value of 100
   // is equivalent to 1.0.
   // This is for purposes of party size for dividing XP awards by.
   // By PnP only PCs would count, and possibly henchmen too, but you might
   // want to tweak others for balance purposes, for example to hinder a solo
   // wizard with dozens of summons.
   //SetLocalInt(oMod, "PRC_XP_SUMMONED_PARTY_COUNT_x100", 100);

   // Use SetXP rather than GiveXP. Will bypass any possible Bioware
   // interference.
   //SetLocalInt(oMod, "PRC_XP_USE_SETXP", FALSE);

   // Give XP to NPCs
   //SetLocalInt(oMod, "PRC_XP_GIVE_XP_TO_NPCS", TRUE);

   // PCs must be in the same area as the CR to gain XP.
   // Helps stop powerlevelling by deterring low level characters hanging around
   // with 1 very strong char.
   SetLocalInt(oMod, "PRC_XP_MUST_BE_IN_AREA", TRUE);

   // Maximum distance that a PC must be to gain XP.
   // Helps stop powerlevelling by deterring low level characters hanging around
   // with 1 very strong char.
   //SetLocalInt(oMod, "PRC_XP_MAX_PHYSICAL_DISTANCE", 9999);

   // Maximum level difference in levels between killer and PC being awarded XP.
   // Helps stop powerlevelling by detering low level characters hanging around
   // with 1 very strong char.
   //SetLocalInt(oMod, "PRC_XP_MAX_LEVEL_DIFF", 99);

   // Gives XP to NPCs when no PCs are in their faction
   // This might cause lag if large numbers of NPCs in the same faction.
   SetLocalInt(oMod, "PRC_XP_GIVE_XP_TO_NON_PC_FACTIONS", FALSE);

   // Database and Letoscript switches

   // Set this if you want to use the bioware db for 2da caching
   // the value is the number of Hbs between caching runs
   // Defaults to 300 (30 mins) if not set
   // cache will be flushed automatically when the PRC version changes
   // If this is set to -1 or lower, it is never stored for persistance over
   // module restarts.
   // The bioware database will bloat infinitely on Linux, due to biowares poor
   // handling.
   //SetLocalInt(oMod, "PRC_USE_BIOWARE_DATABASE", FALSE);

   // 2da caching code uses local variables on a token on a creatures inventory
   // This does not stop the creature being created or stored since the new
   // spellbooks and psionics need it. It merely stops the 2das being cached on
   // the creature as well.
   // NOTE: a value of 0 is on by default, any other value is off
   //SetLocalInt(oMod, "PRC_2DA_CACHE_IN_CREATURE", 0);

   // 2da caching code will get/set directly in the bioware db
   // Off by default, gets are quite quick, sets much slower
   //SetLocalInt(oMod, "PRC_2DA_CACHE_IN_BIOWAREDB", FALSE);

   // 2da caching code will get/set directly in a NWNX db
   // Must have PRC_USE_DATABASE turned on and a database setup
   // Must have a PRC_DB_* variable on to set what type of database to use
   //SetLocalInt(oMod, "PRC_2DA_CACHE_IN_NWNXDB", FALSE);

   // Set this if you are using NWNX and any sort of database.
   //SetLocalInt(oMod, "PRC_USE_DATABASE", FALSE);

   // Set this if you are using SQLite (the built-in database in NWNX-ODBC2).
   // This will use transactions and SQLite specific syntax.
   //SetLocalInt(oMod, "PRC_DB_SQLLITE", FALSE);

   // This is the interval of each transaction. By default it is 600 seconds.
   // Shorter will mean slower, but less data lost in the event of a server
   // crash.  Longer is visa versa.
   //SetLocalInt(oMod, "PRC_DB_SQLLITE_INTERVAL", 600);

   // Set this if you are using MySQL.
   // This will not use transactions and will use MySQL specific syntax
   //SetLocalInt(oMod, "PRC_DB_MYSQL", FALSE);

   // This will precache 2da files into the database.
   // The first time a module runs with this set it will lag a lot for a
   // long time as the game does 2da reads.
   // Afterwards it will be much faster.
   // This is a really, really long lag. Like days/weeks type length.
   // This is not the "normal" precaching that the spellbooks & psionics does.
   //SetLocalInt(oMod, "PRC_DB_PRECACHE", FALSE);

   // TODO: Write description.
   //SetLocalInt(oMod, "PRC_USE_LETOSCRIPT", FALSE);

   // Set this to 1 if using build 18
   //SetLocalInt(oMod, "PRC_LETOSCRIPT_PHEONIX_SYNTAX", FALSE);

   // Set this to 1 to have Letoscript convert stat boosts on the hide to
   // permanent ones.
   //SetLocalInt(oMod, "PRC_LETOSCRIPT_FIX_ABILITIES", TRUE);

   // Letoscript needs a string named PRC_LETOSCRIPT_NWN_DIR set to the
   // directory of NWN. If it doesnt work, try different slash options:
   // // \\ / \
   //SetLocalString(oMod, "PRC_LETOSCRIPT_NWN_DIR", "//Games//NWN");

   // Switch so that Unicorn will use the SQL database for SCO/RCO
   // Must have the zeoslib.dlls installed for this
   // UNTESTED!!!
   //SetLocalInt(oMod, "PRC_LETOSCRIPT_UNICORN_SQL", FALSE);

   // This is a string, not integer.
   // If the IP is set, Letoscript will use ActivatePortal instead of booting.
   // The IP and Password must be correct for your server or bad things will happen.
   // - If your IP is non-static make sure this is kept up to date.
   // See the Lexicon entry on ActivatePortal for more information.
   // @see PRC_LETOSCRIPT_PORTAL_PASSWORD
   //SetLocalString(oMod, "PRC_LETOSCRIPT_PORTAL_IP", "127.0.0.1");
   //SetLocalString(oMod, "PRC_LETOSCRIPT_PORTAL_PASSWORD", "");

   // If set you must be using Unicorn.
   // Will use getnewest bic instead of filename reconstruction (which fails if
   // multiple characters have the same name)
   //SetLocalInt(oMod, "PRC_LETOSCRIPT_GETNEWESTBIC", FALSE);

   // ConvoCC switches

   // Activates the ConvoCC.
   // This doesn't turn on the database and letoscript as well, which you must
   // do yourself.
   // @see PRC_USE_DATABASE
   // @see PRC_USE_LETOSCRIPT
   //SetLocalInt(oMod, "PRC_CONVOCC_ENABLE", FALSE);

   // Avariel characters have bird wings.
   //SetLocalInt(oMod, "PRC_CONVOCC_AVARIEL_WINGS", TRUE);

   // Fey'ri characters have bat wings.
   //SetLocalInt(oMod, "PRC_CONVOCC_FEYRI_WINGS", TRUE);

   // Aasimar characters have the option of angel wings
   // Note: Not set by PRC_CONVOCC_ENFORCE_PNP_RACIAL as it isn't part of PnP
   //SetLocalInt(oMod, "PRC_CONVOCC_AASIMAR_WINGS", TRUE);

   // Fey'ri characters have a demonic tail.
   //SetLocalInt(oMod, "PRC_CONVOCC_FEYRI_TAIL", TRUE);

   // Tiefling characters have the option of a demonic tail.
   //SetLocalInt(oMod, "PRC_CONVOCC_TIEFLING_TAIL", TRUE);

   // Force Drow characters to be of the correct gender for their race.
   //SetLocalInt(oMod, "PRC_CONVOCC_DROW_ENFORCE_GENDER", TRUE);

   // Force Genasi clerics to select the relevant elemental domain as one of
   // their feats.
   //SetLocalInt(oMod, "PRC_CONVOCC_GENASI_ENFORCE_DOMAINS", TRUE);

   // Female Rakshasa use the female rakshasa model. Use together with
   // PRC_CONVOCC_USE_RACIAL_APPEARANCES
   // @see PRC_CONVOCC_USE_RACIAL_APPEARANCES
   //SetLocalInt(oMod, "PRC_CONVOCC_RAKSHASA_FEMALE_APPEARANCE", TRUE);

   // A combination switch to turn on all the racial enforcement settings.
   // @see PRC_CONVOCC_RAKSHASA_FEMALE_APPEARANCE
   // @see PRC_CONVOCC_GENASI_ENFORCE_DOMAINS
   // @see PRC_CONVOCC_DROW_ENFORCE_GENDER
   // @see PRC_CONVOCC_TIEFLING_TAIL
   // @see PRC_CONVOCC_FEYRI_TAIL
   // @see PRC_CONVOCC_FEYRI_WINGS
   // @see PRC_CONVOCC_AVARIEL_WINGS
   //SetLocalInt(oMod, "PRC_CONVOCC_ENFORCE_PNP_RACIAL", FALSE);

   // A combination switch to turn on all the feat enforcement settings.
   // Doesn't do anything.
   //SetLocalInt(oMod, "PRC_CONVOCC_ENFORCE_FEATS", FALSE);

   // Stops players from changing their wings. Turning this on gives
   // players only the "none" choice at the wing stage of the convoCC.
   // Use in conjuction with the wing switches.
   // @see PRC_CONVOCC_AVARIEL_WINGS
   // @see PRC_CONVOCC_FEYRI_WINGS
   // @see PRC_CONVOCC_AASIMAR_WINGS
   //SetLocalInt(oMod, "PRC_CONVOCC_DISALLOW_CUSTOMISE_WINGS", FALSE);

   // Stops players from changing their tail. Turning this on gives
   // players only the "none" choice at the tail stage of the convoCC.
   // Use in conjuction with the tail switches.
   // @see PRC_CONVOCC_FEYRI_TAIL
   // @see PRC_CONVOCC_TIEFLING_TAIL
   //SetLocalInt(oMod, "PRC_CONVOCC_DISALLOW_CUSTOMISE_TAIL", FALSE);

   // Stops players from changing their model at all. Doesn't do anything
   //SetLocalInt(oMod, "PRC_CONVOCC_DISALLOW_CUSTOMISE_MODEL", FALSE);

   // Players are only given a choice of appearances that match their race.
   // For most races, this is the default appearance defined in racialtypes.2da.
   // @see PRC_CONVOCC_RAKSHASA_FEMALE_APPEARANCE
   //SetLocalInt(oMod, "PRC_CONVOCC_USE_RACIAL_APPEARANCES", FALSE);

   // Player can only choose a portrait that matches their race as in
   // portraits.2da. Because Bioware's elf, dwarf etc. subrace portraits are
   // labelled as eg. 'elf' not 'drow' and because half elves have no
   // portraits, this is actually done on appearance and not on race for
   // PCs using Bioware's PC appearance models.
   //SetLocalInt(oMod, "PRC_CONVOCC_USE_RACIAL_PORTRAIT", FALSE);

   // Players can only select from the player voicesets. NPC voicesets are not
   // complete, so wont play sounds for many things such as emotes.
   //SetLocalInt(oMod, "PRC_CONVOCC_ONLY_PLAYER_VOICESETS", FALSE);

   // Only allows players to select voiceset of the same gender as their
   // character.
   //SetLocalInt(oMod, "PRC_CONVOCC_RESTRICT_VOICESETS_BY_SEX", FALSE);

   // Allow players to keep their existing voiceset.
   // The ConvoCC cannot allow players to select custom voiceset, so the
   // only way for players to have them is to select them in the Bioware
   // character creator and then select to keep them in the ConvoCC.
   //SetLocalInt(oMod, "PRC_CONVOCC_ALLOW_TO_KEEP_VOICESET", TRUE;

   // Allow players to keep their existing portrait.
   // The ConvoCC cannot allow players to select custom portraits, so the
   // only way for players to have them is to select them in the Bioware
   // character creator and then select to keep them in the ConvoCC.
   //SetLocalInt(oMod, "PRC_CONVOCC_ALLOW_TO_KEEP_PORTRAIT", TRUE);

   // Only allow players to select portraits of the same gender as their
   // character.
   // Most of the NPC portraits do not have a gender so are also removed.
   //SetLocalInt(oMod, "PRC_CONVOCC_RESTRICT_PORTRAIT_BY_SEX", FALSE);

   // This option give players the ability to start with racial hit dice
   // for some of the more powerful races. These are defined in ECL.2da.
   // For these races, players do not pick a class in the ConvoCC but instead
   // select 1 or more levels in a racial class (such as monsterous humanoid, or
   // outsider).
   // This is not a complete ECL system, it merely gives players the racial hit
   // dice component of their race. It does not make any measure of the Level
   // Adjustment component. For example, a pixie has no racial hit dice, but
   // has a +4 level adjustment. Doesn't do anything.
   //SetLocalInt(oMod, "PRC_CONVOCC_ENABLE_RACIAL_HITDICE", FALSE);

   // This option allows players to keep their skillpoints from one level to
   // the next, if they want to.
   //SetLocalInt(oMod, "PRC_CONVOCC_ALLOW_SKILL_POINT_ROLLOVER", TRUE);

   // This will identify new characters based on XP as in v1.3
   // This is less secure than using the encrypted key.
   // @see PRC_CONVOCC_ENCRYPTION_KEY
   //SetLocalInt(oMod, "PRC_CONVOCC_USE_XP_FOR_NEW_CHAR", FALSE);

   // This is the key used to encrypt characters' names if USE_XP_FOR_NEW_CHAR
   // is false in order to identify returning characters. It should be in the
   // range 1-100.
   // If USE_XP_FOR_NEW_CHAR is true along with this, then returning characters
   // will be encrypted too, so once everyone has logged on at least once,
   // USE_XP_FOR_NEW_CHAR can be set to false for greater security.
   // WARNING: Changing this value after some PCs have gone through the
   // convoCC will cause them to have to go through it again. The encryption
   // uses the player's public CD key, so they won't be able to log into their
   // account from different NWN installs as the key won't match using this
   // system.
   //SetLocalInt(oMod, "PRC_CONVOCC_ENCRYPTION_KEY", 1);

   // As requested, an option to alter the amount of points available in the
   // stat point-buy at character creation.
   // Default: 30
   //SetLocalInt(oMod, "PRC_CONVOCC_STAT_POINTS", 30);

   // As requested, if set this will give a number of bonus feats equal to this
   // value to each created character, similar to human Quick To Master feat.
   //SetLocalInt(oMod, "PRC_CONVOCC_BONUS_FEATS", FALSE);

   // As requested, this will cap the maximum a stat can start at, excluding
   // racial modifiers.
   // Default: 18
   //SetLocalInt(oMod, "PRC_CONVOCC_MAX_STAT", 99);

   // As requested, this will change the skill point multiplier at level 1.
   // Default: 4
   //SetLocalInt(oMod, "PRC_CONVOCC_SKILL_MULTIPLIER", 4);

   // As requested, this will give a bonus to skill points after multiplication.
   //SetLocalInt(oMod, "PRC_CONVOCC_SKILL_BONUS", FALSE);

   // When set, the convoCC NO LONGER STARTS AUTOMATICALLY on logging in.
   // It must be called by a script in the module. This allows the module
   // builder to start the convoCC from a particular area or trigger's
   // On Enter event. The script should call the convoCC with
   // ExecuteScript("prc_ccc_main", oPC) where oPC is the PC. It's advisable
   // to check the entering object is a PC and not a NPC or DM.
   //SetLocalInt(oMod, "PRC_CONVOCC_CUSTOM_START_LOCATION", FALSE);

   // When set, this switch causes a custom script to be used to determine
   // whether a PC should go through the convoCC or not.
   // The script must:
   // - be called "ccc_custom_enter"
   // - set the local int "CONVOCC_LAST_STATUS" on the PC (OBJECT_SELF)
   // - include prc_ccc_const (for the constants the local int can be set to)
   // otherwise the PC will always be booted
   // possible values for CONVOCC_LAST_STATUS:
   // CONVOCC_ENTER_BOOT_PC (causes the PC to get kicked)
   // CONVOCC_ENTER_NEW_PC (causes the PC to go through the convoCC)
   // CONVOCC_ENTER_RETURNING_PC (causes the PC to skip the convoCC)
   // This switch will completely bypass the convoCC methods for determining
   // whether to run the convoCC on an entering PC, so if necessary, your
   // custom marker for 'done' would be set in 'ccc_custom_exit'.
   // @see PRC_CONVOCC_CUSTOM_EXIT_SCRIPT
   //SetLocalInt(oMod, "PRC_CONVOCC_CUSTOM_ENTER_SCRIPT", FALSE);


   // When set, this switch causes a custom script to be executed at the
   // last stage of the convoCC, just before booting the player. The script
   // must be named 'ccc_custom_exit'.
   // Possible uses include: giving PCs gold and/or equipment, giving PCs
   // PW items (even plot items get removed at the start of the convoCC),
   // setting a new persistant location, setting a custom marker for having
   // done the convoCC in conjunction with 'ccc_custom_enter'.
   // @see PRC_CONVOCC_CUSTOM_ENTER_SCRIPT
   //SetLocalInt(oMod, "PRC_CONVOCC_CUSTOM_EXIT_SCRIPT", FALSE);

   // Truenaming

   // Sets the CR Multiplier for Evolving Mind utterances
   // This is divided by 100 to get a float.
   // Ex: To multiply by 1.5, set this value to 150
   // The formula used is (CR   // Multiplier) + 15
   // defaults to PnP: (CR   // 2) + 15
   //SetLocalInt(oMod, "PRC_TRUENAME_CR_MULTIPLIER", 100);

   // Gives a bonus based on Truenamer level
   // PC Truenamer level is divided by this value
   // Ex: To give a bonus equal to 1/2 Truenamer level, set this to 2
   // The formula used is (CR   // Multiplier) + 15 - Bonus
   // defaults to PnP: 0/No bonus
   //SetLocalInt(oMod, "PRC_TRUENAME_LEVEL_BONUS", 0);

   // Sets the Constant value added to the DC
   // Ex: To make the constant 10, simply set this value to 10
   // The formula used is (CR   // Multiplier) + Constant
   // defaults to PnP: +15.
   //SetLocalInt(oMod, "PRC_TRUENAME_DC_CONSTANT", 15);

   // Sets the Constant value added to the DC
   // Ex: To make the constant 10, simply set this value to 10
   // The formula used is Constant + (2   // Utterance Level)
   // defaults to PnP: +25.
   //SetLocalInt(oMod, "PRC_PERFECTED_MAP_CONSTANT", 25);

   // Sets the Multiplier value added to the DC
   // Ex: To make the multiplier 4, simply set this value to 4
   // The formula used is 25 + (Multiplier   // Utterance Level)
   // defaults to PnP: 2.
   //SetLocalInt(oMod, "PRC_PERFECTED_MAP_MULTIPLIER", 2);

   // Debugging

   // Toggles everything guarded by "if(DEBUG)". Mostly calls to DoDebug().
   SetLocalInt(oMod, "PRC_DEBUG", FALSE);
}
