/********************** interface Instance *************************************
Autor: Guido Gustavo Pollitzer
Version: 0.1
Descripcion: interface base de todos los typos polimorficos
*******************************************************************************/
#include "Fwk_Address"
#include "Fwk_Polymorphism"


///////////////////////// CONSTANTS ////////////////////////////////////////////

const string Instance_TYPE_NONE = "";

///////////////////////////// CAMPOS ///////////////////////////////////////////

const string Instance_type_FIELD = ".itancType";


/////////////////// OPERACIONES DE CLASE ///////////////////////////////////////

// Devuelve verdadero si existe una instancia en el domicilio dado por 'domicilio'.
// Advertencia: solo funciona para clases derivadas de Instance
int Instance_isConstructed( struct Address domicilio );
int Instance_isConstructed( struct Address domicilio ) {
    return GetLocalString( domicilio.nbh, domicilio.path + Instance_type_FIELD ) != Instance_TYPE_NONE;
}

/////////////////// instance unimorphic operations ///////////////////////

// Destructor unimorfico de Insance.
// ADVERTANCIA: solo debe ser llamado desde el final de los destructores de los
// tipos derivados inmediatos.
void Instance_destructor_UMC( struct Address this );
void Instance_destructor_UMC( struct Address this ) {
    DeleteLocalString( this.nbh, this.path + Instance_type_FIELD );
}

// Devuelve el identificador de tipo de esta instancia
string Instance_getType( struct Address this );
string Instance_getType( struct Address this ) {
    return GetLocalString( this.nbh, this.path + Instance_type_FIELD );
}

// Pone el identificador de tipo de esta instancia
void Instance_setType( struct Address this, string typeId );
void Instance_setType( struct Address this, string typeId ) {
    SetLocalString( this.nbh, this.path + Instance_type_FIELD, typeId );
}


//////////////////// polymorphic operations identifiers //////////////////////

const int Instance_destructor_OPERATION_ID = 1;
const int Instance_toText_OPERATION_ID = 2;
const int Instance_isEqual_OPERATION_ID = 3;


//////////////////// polymorphic operations dispatchers ////////////////////////

// Destructor polimorfico de instancias de clases que hereden de Instance.
void Instance_destructor( struct Address this );
void Instance_destructor( struct Address this ) {
    // enlatado del identificador de operacion y  los parametros: this
    SetLocalInt( this.nbh, Polymorphism_OPERATION_ID, Instance_destructor_OPERATION_ID );
    SetLocalString( this.nbh, Polymorphism_THIS_REF, this.path );

    // ejecucion de operacion
    ExecuteScript( GetLocalString( this.nbh, this.path + Instance_type_FIELD ), this.nbh );

    // eliminacion de variables de enlatado
    DeleteLocalInt( this.nbh, Polymorphism_OPERATION_ID );
    DeleteLocalString( this.nbh,Polymorphism_THIS_REF );
}


string Instance_toText( struct Address this );
string Instance_toText( struct Address this ) {
    // enlatado del identificador de operacion y  los parametros: this
    SetLocalInt( this.nbh, Polymorphism_OPERATION_ID, Instance_toText_OPERATION_ID );
    SetLocalString( this.nbh, Polymorphism_THIS_REF, this.path );

    // ejecucion de operacion
    ExecuteScript( GetLocalString( this.nbh, this.path + Instance_type_FIELD ), this.nbh );

    // desenlatado del resultadl
    string resultado = GetLocalString( this.nbh, Polymorphism_RESULT_1_REF );

    // eliminacion de variables de enlatado
    DeleteLocalInt( this.nbh, Polymorphism_OPERATION_ID );
    DeleteLocalString( this.nbh, Polymorphism_THIS_REF );
    DeleteLocalString( this.nbh, Polymorphism_RESULT_1_REF );

    return resultado;
}


int Instance_isEqual( struct Address this, struct Address other );
int Instance_isEqual( struct Address this, struct Address other ) {
    // enlatado del identificador de operacion y  los parametros: 'this' y 'other'
    SetLocalInt( this.nbh, Polymorphism_OPERATION_ID, Instance_isEqual_OPERATION_ID );
    SetLocalString( this.nbh, Polymorphism_THIS_REF, this.path );
    SetLocalObject( this.nbh, Polymorphism_PARAMETER_1_REF, other.nbh );
    SetLocalString( this.nbh, Polymorphism_PARAMETER_2_REF, other.path );

    // ejecucion de operacion
    ExecuteScript( GetLocalString( this.nbh, this.path + Instance_type_FIELD ), this.nbh );

    // desenlatado del resultado
    int resultado = GetLocalInt( this.nbh, Polymorphism_RESULT_1_REF );

    // eliminacion de variables de enlatado
    DeleteLocalInt( this.nbh, Polymorphism_OPERATION_ID );
    DeleteLocalString( this.nbh, Polymorphism_THIS_REF );
    DeleteLocalObject( this.nbh, Polymorphism_PARAMETER_1_REF );
    DeleteLocalString( this.nbh, Polymorphism_PARAMETER_2_REF );
    DeleteLocalString( this.nbh, Polymorphism_RESULT_1_REF );

    return resultado;
}

//void main() {}
