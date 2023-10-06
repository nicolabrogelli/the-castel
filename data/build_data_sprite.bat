@echo on
setlocal EnableDelayedExpansion


:: Image
set BuildImage=1


:: Path
set Tools=C:\Users\87003101\git-msxgl\tools
set MSXtk=%Tools%\MSXtk\bin
set Dest=C:\Users\87003101\msxgl-workspace\the_castel\data
set FullPath=%~d0%~p0

if not exist %Dest% md %Dest%


::-----------------------------------------------------------------------------
:: Build image data
if %BuildImage%==1 (
	echo ----------------------------------------
	echo Building image data...

	%MSXtk%\MSXimg.exe img\data.png -copy gk.txt -out %Dest%\data_sprt_layer.h -pos 0 128  -size 16 16 -num 13 1 -name g_DataSprtLayer -mode sprt ^
		-l i16 0 0 1 1 0x311433 ^
		-l i16 0 0 1 1 0xFDF3F1 0xBAD6D2 0x7A9CAB ^
		-l i16 0 0 1 1 0xEB8929 0xC0524B ^
		-l i16 0 0 1 1 0x311433 0xBAD6D2 0x7A9CAB 0xC0524B
)





pause