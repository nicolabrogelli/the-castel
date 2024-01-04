;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module memory
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Mem_DynamicMerge
	.globl _g_MemChunkRoot
	.globl _g_StackAddress
	.globl _Mem_HeapAlloc
	.globl _Mem_HeapFree
	.globl _Mem_Copy
	.globl _Mem_Set
	.globl _Mem_Set_16b
	.globl _Mem_DynamicInitialize
	.globl _Mem_DynamicAlloc
	.globl _Mem_DynamicFree
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_StackAddress::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_MemChunkRoot::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:24: void* Mem_HeapAlloc(u16 size)
;	---------------------------------
; Function Mem_HeapAlloc
; ---------------------------------
_Mem_HeapAlloc::
	ld	c, l
	ld	b, h
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:26: u16 addr = g_HeapStartAddress;
	ld	de, (_g_HeapStartAddress)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:27: g_HeapStartAddress += size;
	ld	hl, #_g_HeapStartAddress
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:28: return (void*)addr;
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:29: }
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:33: void Mem_HeapFree(u16 size)
;	---------------------------------
; Function Mem_HeapFree
; ---------------------------------
_Mem_HeapFree::
	ex	de, hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:35: g_HeapStartAddress -= size;	
	ld	hl, #_g_HeapStartAddress
	ld	a, (hl)
	sub	a, e
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, d
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:36: }
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:40: void Mem_Copy(const void* src, void* dest, u16 size) __NAKED // Stack: 4 bytes
;	---------------------------------
; Function Mem_Copy
; ---------------------------------
_Mem_Copy::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:59: __endasm;
	pop	iy
	pop	bc
	ldir
	 mem_copy_end:
	jp	(iy)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:60: }
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:111: void Mem_Set(u8 val, void* dest, u16 size) __NAKED // Stack: 4 bytes
;	---------------------------------
; Function Mem_Set
; ---------------------------------
_Mem_Set::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:138: __endasm;
	push	de
	pop	hl
	ld	(hl), a
	inc	de
	pop	iy
	pop	bc
	dec	bc
	ldir
	 mem_fill_end:
	jp	(iy)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:139: }
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:143: void Mem_Set_16b(u16 val, void* dest, u16 size)
;	---------------------------------
; Function Mem_Set_16b
; ---------------------------------
_Mem_Set_16b::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:177: __endasm;
	push	de
	ex	de, hl
	ld	(hl), d
	inc	hl
	ld	(hl), e
	inc	hl
	ex	de, hl
	pop	hl
	pop	iy
	pop	bc
	dec	bc
	dec	bc
	ldir
	 mem_fill16_end:
	jp	(iy)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:178: }
	pop	hl
	pop	af
	jp	(hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:249: void Mem_DynamicInitialize(void* base, u16 size)
;	---------------------------------
; Function Mem_DynamicInitialize
; ---------------------------------
_Mem_DynamicInitialize::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:251: g_MemChunkRoot = (struct MemChunkHeader*)base;
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:252: g_MemChunkRoot->Size = (size - sizeof(struct MemChunkHeader)) | MEM_CHUNK_FREE;
	ld	(_g_MemChunkRoot), hl
	ld	a, e
	add	a, #0xfc
	ld	c, a
	ld	a, d
	adc	a, #0xff
	ld	b, a
	set	7, b
	ld	(hl), c
	inc	hl
	ld	(hl), b
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:253: g_MemChunkRoot->Next = NULL;
	ld	hl, (_g_MemChunkRoot)
	inc	hl
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:254: }
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:258: void* Mem_DynamicAlloc(u16 size)
;	---------------------------------
; Function Mem_DynamicAlloc
; ---------------------------------
_Mem_DynamicAlloc::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-8
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), l
	ld	-1 (ix), h
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:265: struct MemChunkHeader* chunk = g_MemChunkRoot;
	ld	de, (_g_MemChunkRoot)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:266: while(chunk)
00107$:
	ld	a, d
	or	a, e
	jp	Z, 00109$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:268: u16 chunkSize = chunk->Size;
	ld	l, e
	ld	h, d
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:269: if(chunkSize & MEM_CHUNK_FREE) // Free chunk
	bit	7, h
	jp	Z,00106$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:271: chunkSize &= ~MEM_CHUNK_FREE;
	res	7, h
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:272: if(chunkSize == size) // Re-use chunk
	ld	a, l
	sub	a, -2 (ix)
	jr	NZ, 00102$
	ld	a, h
	sub	a, -1 (ix)
	jr	NZ, 00102$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:274: chunk->Size &= ~MEM_CHUNK_FREE;
	res	7, b
	ld	l, e
	ld	h, d
	ld	(hl), c
	inc	hl
	ld	(hl), b
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:275: return (void*)((u16)chunk + sizeof(struct MemChunkHeader));
	inc	de
	inc	de
	inc	de
	inc	de
	jp	00110$
00102$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:277: u16 needSize = size + sizeof(struct MemChunkHeader);
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:278: if(chunkSize > needSize) // Create new sub-chunk
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC, 00106$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:280: struct MemChunkHeader* newChunk = (struct MemChunkHeader*)(chunk + needSize); // New free sub-chunk
	push	bc
	pop	iy
	add	iy, iy
	add	iy, iy
	add	iy, de
	inc	sp
	inc	sp
	push	iy
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:281: newChunk->Size = (chunkSize - needSize) | MEM_CHUNK_FREE;
	cp	a, a
	sbc	hl, bc
	ld	c, l
	ld	b, h
	set	7, b
	pop	hl
	push	hl
	ld	(hl), c
	inc	hl
	ld	(hl), b
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:282: newChunk->Next = chunk->Next;
	ld	a, -8 (ix)
	add	a, #0x02
	ld	-6 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	-4 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-3 (ix), a
	dec	bc
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:284: chunk->Size = size; // Allocated sub-chunk
	ld	l, e
	ld	h, d
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:285: chunk->Next = newChunk;
	ld	a, -8 (ix)
	ld	(bc), a
	inc	bc
	ld	a, -7 (ix)
	ld	(bc), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:287: return (void*)((u16)chunk + sizeof(struct MemChunkHeader));
	inc	de
	inc	de
	inc	de
	inc	de
	jp	00110$
00106$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:290: chunk = chunk->Next;
	ex	de, hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	jp	00107$
00109$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:292: return NULL;
	ld	de, #0x0000
00110$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:293: }
	ld	sp, ix
	pop	ix
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:297: void Mem_DynamicMerge()
;	---------------------------------
; Function Mem_DynamicMerge
; ---------------------------------
_Mem_DynamicMerge::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:299: struct MemChunkHeader* chunk = g_MemChunkRoot;
	ld	bc, (_g_MemChunkRoot)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:300: while(chunk)
00105$:
	ld	a, b
	or	a, c
	jr	Z, 00108$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:302: struct MemChunkHeader* nextChunk = chunk->Next;
	ld	hl, #0x0002
	add	hl, bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:303: if((nextChunk != NULL) && (chunk->Size & MEM_CHUNK_FREE) && (nextChunk->Size & MEM_CHUNK_FREE))
	ld	-1 (ix), a
	or	a, -2 (ix)
	jr	Z, 00102$
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	bit	7, d
	jr	Z, 00102$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	bit	7, h
	jr	Z, 00102$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:305: chunk->Size += nextChunk->Size + sizeof(struct MemChunkHeader);
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	add	hl, de
	ex	de, hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:306: chunk->Next = nextChunk->Next;
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	pop	hl
	push	hl
	ld	(hl), c
	inc	hl
	ld	(hl), b
00102$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:308: chunk = chunk->Next;
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	jp	00105$
00108$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:310: }
	ld	sp, ix
	pop	ix
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:314: void Mem_DynamicFree(void* ptr)
;	---------------------------------
; Function Mem_DynamicFree
; ---------------------------------
_Mem_DynamicFree::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:316: struct MemChunkHeader* chunk = (struct MemChunkHeader*)((u16)ptr - sizeof(struct MemChunkHeader));
	ld	a, l
	add	a, #0xfc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:317: chunk->Size |= MEM_CHUNK_FREE;
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	set	7, b
	ld	(hl), c
	inc	hl
	ld	(hl), b
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:318: Mem_DynamicMerge();
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/memory.c:319: }
	jp	_Mem_DynamicMerge
	.area _CODE
	.area _INITIALIZER
__xinit__g_MemChunkRoot:
	.dw #0x0000
	.area _CABS (ABS)
