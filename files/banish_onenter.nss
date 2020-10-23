void main() {
    object enteringObject = GetEnteringObject();
    if( GetIsPC( enteringObject ) ) {
        if( !GetIsDM( enteringObject ) )
            ApplyEffectToObject( DURATION_TYPE_PERMANENT, EffectSpellFailure( 100 ), enteringObject );
    }
    else
        ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectDeath(), enteringObject );
}
