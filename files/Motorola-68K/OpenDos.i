
SysBase         = 4     ; Basis von Exec
LVOOpenLibrary  = -552  ; Library oeffnen
LVCloseLibrary  = -414  ; Library schliessen

LVOOutput       = -60   ; DOS: Output-Handle holen
LVOWrite        = -48   ; Ausgabe
LVORead         = -42
LVOInput        = -54


main:
    lea dosname,a1          ; Name der DOS-lib
    moveq  #0,d0            ; Version ist egal
    move.l SysBase,a6       ; Basic Exec
    jsr LVOOpenLibrary(a6)  ; DOS-lib oeffnen
    tst.l d0                ; Fehler?
    beq fini                ; Wenn Fehler dann ist hier ende
    move.l d0, a6           ; Zeiger merken

    jsr LVOOutput(a6)       ;Hole Output-Handle
