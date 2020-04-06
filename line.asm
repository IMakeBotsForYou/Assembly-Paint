drawLine macro color, firstX, secondX, firstY, secondY
local firstCoords, secondcoords, check
check: 
	cmp coordsGot, 0
	je firstCoords
	cmp coordsGot, 1
	je secondcoords
firstCoords:
mov ax, 03h ;INT 33,3 - Get Mouse Position(CX,DX) and Button Status(BX)
int 33h ;;CX = X || DX = Ys
mov firstX, cx
mov firstY, dx
add coordsGot, 1
secondcoords:
	mov ah, 06h     ;;Check keyboard buffer for input
	mov dl, 255     ;Entry: DL = character (except FFh)
	int 21h 		;Return: AL = character output (note to self)
	cmp al, 6Ch
	mov ax, 03h ;INT 33,3 - Get Mouse Position(CX,DX) and Button Status(BX)
	int 33h ;;CX = X || DX = Ys
	mov secondX, cx
	mov secondY, dx
	rectangle color, firstX, secondX, firstY, secondY
endm
