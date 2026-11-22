//=============================================================================
// SEGMENT: 9
// BANK: 1
// DESCRIPTION: 
//=============================================================================

// Firma per il riconoscimento del mapper: openMSX (avvio manuale senza -romtype)
// conta le istruzioni LD (nnnn),A per indovinare il mapper; LD (0x77FF),A
// (32 FF 77) e' tipica dell'ASCII16. Dati mai eseguiti.
const unsigned char g_MapperHintASCII16[] = {
	0x32, 0xFF, 0x77, 0x32, 0xFF, 0x77, 0x32, 0xFF, 0x77, 0x32, 0xFF, 0x77,
};
