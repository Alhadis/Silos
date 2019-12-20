package main

using import "core:fmt"
using import "core:runtime"
using import "core:os"
import "core:strings"
import "core:strconv"
import "core:math/rand"

move_type :: enum{neutral,atk,def,powerup}
saiyan_state :: enum{giant_monkey,saiyan,super_saiyan,fusion}
status :: enum{nothing,poison,shitface,aged,rage,horny,irritated,intrigued,cocky,chilling,brainstorming,surprised,scared_shitless}
body_part :: enum{face,spine,legs,arms,chest,balls}

fighter_hit_prob_for_move :: struct
{
    f : int,//index into fighter table
    m : int,//index into move table
    probability   : f32,//0 to 1 pct of accuracy
    ability_bonus : f32,//player skill at that move 0 to 1
}

//ids are indices into the arrays for simplicity
move :: struct
{
    index : u32,
    name : string,
    atk : f32,
    def : f32,
    eng : f32,//energy required // stamina use
    type : move_type,
}

fighter :: struct
{
    name : string,
    agility : f32,
    stamina : f32,
    power   : f32,
    speed   : f32,
    move_indices   : [dynamic]int,//moves id
    fusable_partners : [dynamic]int,//fighters id
}

game_state :: struct
{
    f : [dynamic]fighter,
    ml : [dynamic]move,
    hitprob : [dynamic]fighter_hit_prob_for_move,
    players : [2]fighter,
    stage : int,//0 main // 1 char select //2 battle
}

player :: struct
{
    hp : f32,
    ki : f32,
    states : [dynamic]status,
    ss : saiyan_state,
    f : ^fighter,
}

battle_state :: struct
{
   players : [2]player,
   sel_moves : [2]move,//
}

main :: proc()
{
//game init
    using  gs := game_state{};
    
//fighter
    goku_moves := [dynamic]int{0,1};
    veg_moves := [dynamic]int{0,1};
    fpgoku := [dynamic]int{};
    fpgveg := [dynamic]int{};
    
    append(&f,fighter{"Goku",50,50,40,10,goku_moves,fpgoku});
    append(&f,fighter{"Vegeta",50,50,40,10,veg_moves,fpgveg});
//moves    
    append(&ml,move{0,"stare and grunt" ,0,0,0,move_type.neutral});
    append(&ml,move{1,"Try to raise KI." ,0,0,2,move_type.powerup});
    append(&ml,move{2,"punch",10,4,10,move_type.atk});
    append(&ml,move{3,"kick" ,15,0,20,move_type.atk});

    append(&hitprob,fighter_hit_prob_for_move{0,0,90,100});
    append(&hitprob,fighter_hit_prob_for_move{0,1,100,30});
    append(&hitprob,fighter_hit_prob_for_move{0,2,40,50});
    append(&hitprob,fighter_hit_prob_for_move{0,3,40,70});
    
    append(&hitprob,fighter_hit_prob_for_move{1,0,100,90});
    append(&hitprob,fighter_hit_prob_for_move{1,1,50,5});
    append(&hitprob,fighter_hit_prob_for_move{1,2,80,70});
    append(&hitprob,fighter_hit_prob_for_move{1,3,80,70});

    //runs at compile time only
    when false
    {
       for move in gs.ml
       {
            print(move);
       }
    }

    //gaame start
    println("------- Dragonball TurnFight---------- \n");
    println("------- Press enter to cont ---------- \n");
    get_input();

    sel_f,ene_f := char_select(&gs);

    println("------- You are now ready for battle! ---------- \n");
    println("------- Press enter to FIGHT! ---------- \n");
    get_input();

    println("------- BATTLE START!     ---------- \n");
    println("------- PREPARE YOURSELF! ---------- \n");

    //prepare battle data
    gs.players[0] = sel_f;
    gs.players[1] = ene_f;
    bs := battle_state{};
    def_d := [dynamic]status{status.nothing};
    
    bs.players[0] = player{100,0,def_d,saiyan_state.saiyan,&gs.players[0]};
    bs.players[1] = player{100,0,def_d,saiyan_state.saiyan,&gs.players[0]};

    p1 := &bs.players[0];
    p2 := &bs.players[1];
    for 
    {
        bs.sel_moves[0] = player_action_select(&gs);
        bs.sel_moves[1] = cpu_action_select(&gs);

        execute_moves(&gs,&bs);
        
        printf("Player1 %s now has %f hp : %f ki ---------- \n",p1.f.name,p1.hp,p1.ki);
        printf("Player2 %s now hasl %f hp : %f ki ---------- \n",p2.f.name,p2.hp,p2.ki);
        input := get_input();
        if cmp(input,"quit") || cmp(input,"exit"){break;}
    }

    println("------- GOOD BYE!     ---------- \n");    
    println("------- Thanks for playing!     ---------- \n");    
}

calc_atk_damage :: proc(hit,take : ^player,m : move,hprob : fighter_hit_prob_for_move)
{
    rn := rand.float32_range(0,1);
    dam := m.atk * (f32(hprob.probability)/10.0) + (rn * 20);
    take.hp = take.hp - dam;
    println(m.atk);
    printf("ooo!%s takes %f points of damage from a %s \n",take.f.name,dam,m.name);
}

double_attack :: proc(a,b : ^player, am,bm : move,amhp,bmhp : fighter_hit_prob_for_move)
{
    rn := rand.float32_range(0,100);
    println(rn);
    if rn < 40//single hit for a
    {
        calc_atk_damage(a,b,am,amhp);
    }
    else if rn > 40 && rn < 60//double hit
    {
        println("DOUBLE HIT!!!!");
        calc_atk_damage(a,b,am,amhp);
        calc_atk_damage(b,a,bm,bmhp);
    }
    else // single hit for b
    {
        calc_atk_damage(a,b,am,amhp);
    }
    printf("newhp %f \n",b.hp);
}

execute_moves :: proc(gs : ^game_state,bs : ^battle_state)
{
    m1 := bs.sel_moves[0];
    m2 := bs.sel_moves[1];

    m1hprob := gs.hitprob[m1.index];
    m2hprob := gs.hitprob[m2.index];
    
    p1 := &bs.players[0];
    p2 := &bs.players[1];

    rn := rand.float32_range(0,1);
    
    if m1.type == move_type.atk && m2.type == move_type.atk
    {
        println("------- Both fighters are launching attacks!! ---------- \n");
        println("------- WoWzers! ---------- \n");
        double_attack(p1,p2,m1,m2,m1hprob,m2hprob);        
    }
    else if m1.type == move_type.atk && m2.type == move_type.neutral
    {
        calc_atk_damage(p1,p2,m1,m1hprob);        
    }
    else if m2.type == move_type.atk && m1.type == move_type.neutral
    {
        calc_atk_damage(p2,p1,m2,m2hprob);
    }
    else if move_type.atk == m1.type && move_type.powerup == m2.type
    {
        if m1hprob.probability > 0.5 && m1hprob.ability_bonus > 0.1 && p2.ki < 40
        {
            p1.hp -= m1.eng;
            p2.hp -= m2.eng;

            calc_atk_damage(p2,p1,m2,m2hprob);
            printf("%s tried to power up but was hit by %s first.\n",p2.f.name,p1.f.name);
        }
        else
        {
            p1.hp -= m1.eng;
            p2.hp -= m2.eng;

            p1.hp -= m1.eng;
            p2.ki += (m2.eng + ((rn + m2hprob.ability_bonus) * 100));
            printf("%s KI power up blows %s away before he can land the attack.\n",p1.f.name,p2.f.name);
        }
    }
    else if move_type.powerup == m1.type && move_type.powerup == m2.type
    {
        println("Both fighters are POWERING UP !! \n");                              
    }
    else if move_type.def == m1.type && move_type.def == m2.type
    {
        println("Both fighters are defending.... \n");                              
    }
    else if move_type.neutral == m1.type && move_type.neutral == m2.type
    {
        println("Both fighters are thinking hard.... \n");                              
    }
    else 
    {
        println("Both fighters seem confused!? \n");
    }

    printf("%s was doing a %s \n",p1.f.name,m1.name);
    printf("%s was doing a %s \n",p2.f.name,m2.name);
    printf("p1 newhp %f \n",p1.hp);
    printf("p2 newhp %f \n",p2.hp);
}

cpu_action_select :: proc(gs : ^game_state)-> move
{
    rn := rand.float32_range(0,f32(len(gs.ml)));
    ene_m := gs.ml[int(rn)];
    printf("%v\n",ene_m);
    return ene_m;

}

player_action_select :: proc(gs : ^game_state)-> move
{
    println("Pick your action.");
    for m,i in gs.ml
    {
        printf("%d. %v \n",i + 1,m.name);
    }
    sel_m : move;
    input := get_input();
    s_i := strconv.atoi(input);
    if s_i > 0 && s_i <= len(gs.ml)
    {
       sel_m = gs.ml[s_i - 1];
       printf("You have selected %s \n",sel_m.name);
       printf("%v\n",sel_m);                         
    }
    else
    {
        print("invalid selection try again!");
        sel_m = player_action_select(gs);
    }
    return sel_m;
}

char_select :: proc(gs : ^game_state)-> (fighter,fighter)
{
    println("------- Choose your fighter ---------- \n");
    println("------- Press enter to cont ---------- \n");

    for c,i in gs.f
    {
        printf("%d. %v \n",i + 1,c.name);
    }
    
    input := get_input();
    sel_f : fighter;
    ene_f : fighter;

    s_i := strconv.atoi(input);
    if s_i > 0 && s_i <= len(gs.f)
    {
       sel_f = gs.f[s_i - 1];
       printf("You have selected %s \n",sel_f.name);
       printf("%v\n",sel_f);
       rn := rand.float32_range(0,f32(len(gs.f)));
       ene_f = gs.f[int(rn)];
       printf("You will fight %s! \n",ene_f.name);
       printf("%v\n",sel_f);
    }
    else
    {
        print("invalid selection try again!");
        sel_f,ene_f = char_select(gs);
    }
    return sel_f,ene_f;
}

get_input :: proc()-> (string)
{
    a := make([]u8, 6); 
    os.read(os.stdin, a);
    return string(a);
}

cmp :: proc(a,b : string) -> (bool)
{
    return strings.compare(a,b) == 0;
}

