rechercherOccurence:
			MOV R0, #0
			LDR R1, .ptab
			LDR R1, .ptab
			LDR R2, .pEle
			LDR R2, [R2]
			LDR R3, .pn
			LDR R3, [R3]
tantque		CMP R0, R3
			BHS fintantque
			LDR R4, [R1,R0,LSL#2]
			CMP R4, R2
			BEQ fintantque
			ADD R0,r0,#1
			B tantque
fintantque  CMP R0, R2
			LDR R1, .ptrouve
			MOV LO R3, #VRAI
			MOV HS R3, #FAUX
			STRB R3, [R1]
			LDRLO R1, .pRang
			STRLO R0, [R1]
fin
