@echo on
setlocal EnableDelayedExpansion


:: Image
set BuildImage=1


:: Path
set Tools=C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\tools
set MSXtk=%Tools%\MSXtk\bin
set Dest=C:\Users\87003101\msxgl-workspace\the-castel\the-castel\data
set FullPath=%~d0%~p0

if not exist %Dest% md %Dest%



	echo ----------------------------------------
	echo Building image data...

	%MSXtk%\MSXimg.exe img\prova.png -copy gk.txt -out %Dest%\data_sprt_prova.h -pos 0 0  -size 16 16 -num 1 1 -name g_DataSprtLayer -mode sprt ^
		-l i16 0 0 1 1 0x311433 ^
		-l i16 0 0 1 1 0xFDF3F1 0xBAD6D2 0x7A9CAB ^
		-l i16 0 0 1 1 0xEB8929 0xC0524B ^
		-l i16 0 0 1 1 0x311433 0xBAD6D2 0x7A9CAB 0xC0524B






pause