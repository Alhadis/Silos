///////////////////////////////////////////////////////////////////////////////////////////
//:: Script: ro_door_horario                                                             //
//:: Evento: OnAreaEnter                                                                 //
//::                                                                                     //
//:: Destraba la puerta o la traba y cierra segun el horario al aproximarse un personaje //
//::                                                                                     //
//:: Leonel Badano - 18/12/2019                                                          //
///////////////////////////////////////////////////////////////////////////////////////////



//Si no se establece un valor en las propiedades, la puerta es accesible de 7 a 19
void ControlPuerta(int iHoraAbierto = 7, int iHoraCerrado = 19)
{
object oPC = GetEnteringObject();
int iHora =  GetTimeHour();
//Seleccionamos la puerta mas cercana que comparta el mismo tag que el trigger
object oPuerta = GetNearestObjectByTag(GetTag(OBJECT_SELF));
//Revisamos si tiene horarios manualmente asignados en las propiedades
int iHoraAbierto = GetLocalInt(oPuerta, "iHoraAbierto");
int iHoraCerrado = GetLocalInt(oPuerta, "iHoraCerrado");


//Si todavia es temprano o tarde respecto al horario definido y un jugador se acerca, la puerta se cierra con llave
  if (GetIsPC(oPC) && ((iHora < iHoraAbierto) || (iHora >= iHoraCerrado)))
    {
    SetLocked(oPuerta, TRUE);
    ActionCloseDoor(oPuerta);
    }
//Caso contrario, se destraba
  else
    {
    SetLocked(oPuerta, FALSE);
    }
}



void main()
{
ControlPuerta();
}
