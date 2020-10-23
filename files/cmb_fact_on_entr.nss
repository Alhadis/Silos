/*************************************************************************
24/11/06 - Script By Dragoncin
Cambia la faccion de la criatura que entra a la faccion que esta determinada en una variable local de la misma.
Luego, envia la criatura a donde estaba, mediante otra variable local.
Evento: AreaOnEnter
Area donde se aplica: Area de Servicio - Cambio de faccion
*************************************************************************/
void main()
{
    object oCreature = GetEnteringObject();
    int FaccionBuscada = GetLocalInt(oCreature, "FaccionBuscada");
    location DeDondeVino = GetLocalLocation(oCreature, "DeDondeVino");
    if (FaccionBuscada!=0) {
        ChangeToStandardFaction(oCreature, FaccionBuscada);
        AssignCommand(oCreature, ActionJumpToLocation(DeDondeVino));
    }
}
