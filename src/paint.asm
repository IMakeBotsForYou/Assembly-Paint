MODEL small
STACk 64h

DATASEG
vmode db '$'
bgcolor db 0 ;Default bg color is black.
fgcolor db 4 ;Default brush color is red.
fgtitle db ' Current Brush:$'
include intro.asm
;include second.asm
;include first.asm
coordsGot db 0
firstX  dw 0
secondX dw 10
firstY  dw 0
secondY dw 10
firstX5  dw 0
secondX5 dw 10
firstY5  dw 0
secondY5 dw 10

;========================== CIRCLE 
x dw ? ; center x --- just experimenting with circles.
y dw ? ; center y
r dw 100 ; radius
;========================== CIRCLE 
balance dw 0
xoff dw 0
yoff dw 0 
;========================== CIRCLE    
xplusx dw 0
xminusx dw 0
yplusy dw 0
yminusy dw 0
;========================== CIRCLE     
xplusy dw 0
xminusy dw 0
yplusx dw 0
yminusx dw 0
;========================== CIRCLE 
CODESEG
ignoreOrNo macro x1, x2
local comp, ignore, no
comp:	
	mov ax, x1
	cmp ax, x2
	jne no
	ignore:
			;;If X and Y are equal, ignore this action and go back to input check
			;;Since using the rect macro on a rectagle whose size is zero causes problems.
			jmp check 
	no:
endm 
;##########Pseudocode#########
;temp = number1;
;number1 = number2;
;number2 = temp;
;##########Pseudocode#########

;;Drawing must be done UP->DOWN   LEFT->RIGHT.
;;If second chord (X or Y) smaller than the first, swap them.    
;;This guarantees that the drawing wont crash the program
;;While still drawing at the same location.
swapOrNo macro x1, x2
	local comp, dont, switchThem
	comp:
		mov ax, x1
		cmp ax, x2
		jl dont
	switchThem:
		push x2
		mov x2, ax
		pop x1
	dont:
endm
;changeOrNo macro x1, x2
;local comp, exit, addToIt
;	comp:
;		mov ax, x1
;		cmp ax, x2
;		jne exit
;		je addToIt
;	addToIt:
;		add x1, 15
;	exit:
;endm

DrawCircle macro color, circleCenterX, circleCenterY, radius
    ;C# Code
;         int balance;
;         int xoff;
;         int yoff;
    
    
    
    ;C# Code
    ;         xoff = 0;
    ;         yoff = radius;
    ;         balance = -radius;
    
    Assign yoff, radius
    
    Assign balance, radius
    Negate balance
    
    
    ;C# Code
    ;         while (xoff <= yoff)
    ;         {
    draw_circle_loop:
     
     AddAndAssign xplusx, circleCenterX, xoff
     SubAndAssign xminusx, circleCenterX, xoff
     AddAndAssign yplusy, circleCenterY, yoff
     SubAndAssign yminusy, circleCenterY, yoff
     
     AddAndAssign xplusy, circleCenterX, yoff
     SubAndAssign xminusy, circleCenterX, yoff
     AddAndAssign yplusx, circleCenterY, xoff
     SubAndAssign yminusx, circleCenterY, xoff
     
    ;C# Code
    ;        DrawPixel(circleCenterX + yoff, circleCenterY - xoff);
    ; part 1 from angle 0 to 45 counterclockwise
    DrawPixel color, xplusy, yminusx
    
    ;C# Code
    ;       DrawPixel(circleCenterX + xoff, circleCenterY - yoff);
    ; part 2 from angle 90 to 45 clockwise
    DrawPixel color, xplusx, yminusy
    
    ;C# Code
    ;       DrawPixel(circleCenterX - xoff, circleCenterY - yoff); 
    ; part 3 from angle 90 to 135 counterclockwise
    DrawPixel color, xminusx, yminusy
    
    ;C# Code
    ;        DrawPixel(circleCenterX - yoff, circleCenterY - xoff); 
    ; part 4 from angle 180 to 135 clockwise
    DrawPixel color, xminusy, yminusx
    
    ;C# Code
    ;       DrawPixel(circleCenterX - yoff, circleCenterY + xoff); 
    ; part 5 from angle 180 to 225 counterclockwise
    DrawPixel color, xminusy, yplusx
    
        ;C# Code
    ;       DrawPixel(circleCenterX - xoff, circleCenterY + yoff); 
    ; part 6 from angle 270 to 225 clockwise
    DrawPixel color, xminusx, yplusy
        
    ;C# Code
    ;       DrawPixel(circleCenterX + xoff, circleCenterY + yoff); 
    ; part 7 from angle 270 to 315 counterclockwise
    DrawPixel color, xplusx, yplusy
    
    
    ;C# Code
    ;       DrawPixel(circleCenterX + yoff, circleCenterY + xoff); 
    ; part 8 from angle 360 to 315 clockwise
    DrawPixel color, xplusy, yplusx

    
    ;C# Code
    ;        balance = balance + xoff + xoff;
    Add3NumbersAndAssign balance, balance, xoff, xoff
    
    ;C# Code
    ;            if (balance >= 0)
    ;            {
    ; 
    ;               yoff = yoff - 1;
    ;               balance = balance - yoff - yoff;
    ;               
    ;            }
    ; 
    ;            xoff = xoff + 1;
    CompareVariableAndNumber balance, 0
    jl balance_negative
    ;balance_positive:
    DecVar yoff
    
    Sub3NumbersAndAssign balance, balance, yoff, yoff
    
    balance_negative:
    IncVar xoff
    
    ;C# Code
    ;         while (xoff <= yoff)
    Compare2Variables xoff, yoff
    jg end_drawing
    jmp draw_circle_loop
    
    
    end_drawing:
    ; pause the screen for dos compatibility:    
endm


;========================== CIRCLE 
Assign macro a, b
    mov ax, b
    mov a, ax    
endm
;========================== CIRCLE 
;a = -a 
Negate macro a
    mov ax, a
    neg ax
    mov a, ax    
endm
;========================== CIRCLE 
;a = a+1 
IncVar macro a
    mov ax, a
    inc ax
    mov a, ax    
endm
;========================== CIRCLE 
;a = a-1 
DecVar macro a
    mov ax, a
    dec ax
    mov a, ax    
endm
;========================== CIRCLE 
Compare2Variables macro a, b
    mov cx, a
    cmp cx, b
endm

;========================== CIRCLE 
CompareVariableAndNumber macro a, b
    mov cx, a
    cmp cx, b
endm
;========================== CIRCLE 
;c = a+b
AddAndAssign macro x, a, b
    mov ax, a
    add ax, b
    mov x, ax
endm 
;========================== CIRCLE 
;c = a-b
SubAndAssign macro x, a, b
    mov ax, a
    sub ax, b
    mov x, ax
endm
;========================== CIRCLE 
;d = a+b+c
Add3NumbersAndAssign macro d, a, b, x
    mov ax, a
    add ax, b
    add ax, x
    mov d, ax
endm 
;========================== CIRCLE 
;d = a-b-c
Sub3NumbersAndAssign macro d, a, b, x
    mov ax, a
    sub ax, b
    sub ax, x
    mov d, ax
endm
;========================== CIRCLE 
reset macro
mov balance, 0
mov xoff,  0
mov yoff,  0 
    
mov xplusx,  0
mov xminusx,  0
mov yplusy,  0
mov yminusy,  0
    
mov xplusy,  0
mov xminusy,  0
mov yplusx,  0
mov yminusx,  0

endm
DrawPixel macro color, x, y
    
    mov cx, x  ; column  
    mov dx, y  ; row  
     
    mov al, color  ; green
    mov ah, 0ch ; put pixel
    int 10h     
endm
save_vmode macro
    mov ah, 0Fh    ;Get current video mode
    int 10h		   ;
    mov bx, offset vmode     
    mov [bx], al
    mov ah, 09h    
    mov dx, bx
    int 21h
endm
set_vmode macro v
    mov ah, 0    ;Set video mode
    mov al, v
    int 10h
endm

update_bg macro color
    mov ah, 0Bh
    mov bl, color
	
    int 10h
endm

cursor macro x, y
    mov ah, 02h
    mov bh, 0
    mov dh, y
    mov dl, x
    int 10h
endm

show macro string, x, y
    cursor x, y
    mov ah, 09h
    mov dx, offset string
    int 21h
endm

clear_row macro row
    mov ah, 06h
    mov al, 0
    mov ch, row
    mov cl, 0
    mov dh, row
    mov dl, 79
    int 10h
endm
rectangle macro color, x1, x2, y1, y2
    local s, next
    mov dx, y1
    s:
        mov cx, x1
    next:
        mov ah, 0Ch
        mov al, color
        int 10h
        inc cx
        cmp cx, x2
        jne next
        inc dx
        cmp dx, y2
        jne s
endm

print_brush_color macro
    ;;Update 'current brush color' notification
    show fgtitle, 0, 0
    mov bx, offset fgcolor
    rectangle [bx], 130, 145, 0, 15
endm
paint macro x, y
    ;i was having trouble with smart solution so I did something stupid
    mov bx, offset fgcolor
    mov ax, [bx]

    mov ah, 0Ch			;Write graphics pixel
    mov cx, x			;At x (Stored in cx)
    mov dx, y			;At y (Stored in dx)
    int 10h

    mov ah, 0Ch         ;Write graphics pixel
    inc cx
    int 10h

    mov ah, 0Ch
    inc cx
    int 10h

    mov ah, 0Ch
    dec dx
    int 10h

    mov ah, 0Ch
    dec cx
    int 10h

    mov ah, 0Ch
    dec cx
    int 10h

    mov ah, 0Ch
    dec dx
    int 10h

    mov ah, 0Ch
    inc cx
    int 10h

    mov ah, 0Ch
    inc cx
    int 10h
endm
print_intro macro
	mov ah,9h
    mov dx,offset text
    int 21h
    ;;any_key:
    mov ah, 00h
    int 16h
endm
init proc
    save_vmode
    set_vmode 12h
	print_intro
    mov ax, 1                   ;show mouse
    int 33h
    ret
init endp

clear_row macro row
    mov ah, 06h
    mov al, 0
    mov ch, row
    mov cl, 0
    mov dh, row
    mov dl, 79
    int 10h
endm
get_input macro
    local check, save, escape, adjust, bgup, bgdown, fgup, fgdown, clearAll, firstCoord, circle
	escape:
        mov ah, 06h     ;;Check keyboard buffer for input
        mov dl, 255     ;Entry: DL = character (except FFh)
        int 21h 		;Return: AL = character output (note to self)
        cmp al, 1Bh     ;;Esc = exit
        je jmpToExit1
    adjust:
        cmp al, 48h     ;;Up 48h
        je bgup
        cmp al, 50h     ;;Down 50h
        je bgdown
        cmp al, 4Dh     ;;Right 4Dh
        je fgup
        cmp al, 4Bh     ;;Left  4Bh
        je fgdown       
		cmp al, 8h		;;BackSpace
		je clearAll	    ;;0Dh
		cmp al, 63h		;;Circle C
		je outOfRangeCircle
		cmp al, 6Ch     ;;firstCoord L
		je outOfRangeLine1
		cmp al, 74h
		je outOfRangeLine2
		jmp check
	clearAll: ;750 500 |||| 320 200
		rectangle 0, 0, 750, 0, 500 ;;clear screen
		jmp check
    bgup:               ;;Move to next real bg color
        mov bx, offset bgcolor
        mov ax, [bx]
        inc al			
        mov [bx], ax
        update_bg al
        jmp check
    bgdown:
        mov bx, offset bgcolor
        mov ax, [bx]
        dec al
        mov [bx], ax
        update_bg al
        jmp check
    fgup:               ;;Move to next real fg color aka paint brush color
        mov bx, offset fgcolor
        mov ax, [bx]
        inc al
        mov [bx], ax
        cmp al, 16
        je fbound1
        jmp check
        fbound1:
            mov [bx], 1
            jmp check
	jmpToExit1:
		jmp jmpToExit
	outOfRangeCircle:
		jmp circle ;;avoid jmp out of range err
	outOfRangeLine1:
		jmp firstCoord ;;avoid jmp out of range err
	outOfRangeLine2:
		jmp secondCoord ;;avoid jmp out of range err
    fgdown:
        mov bx, offset fgcolor
        mov ax, [bx]
        dec al
        mov [bx], ax
        cmp al, 0
        je fbound2
        fbound2:
            mov [bx], 15
		jmp check
	;==============================================================================
	;==============================================================================
	firstCoord:
		mov ax, 03h ;INT 33,3 - Get Mouse Position(CX,DX) and Button Status(BX)
		int 33h ;;CX = X || DX = Ys
		mov firstX, cx
		mov firstY, dx
		jmp check
	circle:
		mov ax, 03h ;INT 33,3 - Get Mouse Position(CX,DX) and Button Status(BX)
		int 33h ;;CX = X || DX = Ys
		mov x, cx
		mov y, dx ;;reset everything
		mov r, 20              
		DrawCircle fgcolor, x, y, r
		reset
		;mov y, dx ;;reset everything
		jmp check
	jmpToExit:
		jmp exit
	secondCoord:
		mov ah, 06h     ;;Check keyboard buffer for input
		mov dl, 255     ;Entry: DL = character (except FFh)
		int 21h 		;Return: AL = character output (note to self)
		cmp al, 6Ch		;shouldnt do anything special as the character is already L but it doesnt do anything wihtout it so here it stays.
		mov ax, 03h ;INT 33,3 - Get Mouse Position(CX,DX) and Button Status(BX)
		int 33h ;;CX = X || DX = Ys
		mov secondX, cx
		mov secondY, dx
		swapOrNo firstX, secondX ;;Refer to macro definition for explanation
		swapOrNo firstY, secondY ;;Refer to macro definition for explanation
		ignoreOrNo firstX, secondX ;;Refer to macro definition for explanation
		ignoreOrNo firstY, secondY ;;Refer to macro definition for explanation
		push firstX
		push secondX
		push firstY
		push secondY
		sub firstX, 5
		sub secondX, 5
		sub firstY, 5
		sub secondY, 5
		pop secondY5
		pop firstY5
		pop secondX5
		pop firstX5
		rectangle fgcolor, firstX, secondX, firstY, firstY5
		rectangle fgcolor, secondX, secondX5, firstY, secondY
		rectangle fgcolor, firstX, secondX5, secondY, secondY5
		rectangle fgcolor, firstX, firstX5, firstY, secondY5
		add firstX, 5
		add secondX, 5 ;;RESET THEIR VALUES
		add firstY, 5
		add secondY, 5
		jmp check
	check:          ;;Check for mouse input
        print_brush_color
        mov ax, 03h  ;INT33h, 3h  Get Mouse Position and Button Status
        int 33h ;INT 33 - Mouse Function Calls
        cmp bx, 1
        je save
        jmp escape
    save:           ;;Exit when we have coordinates of where mouse was pressed
        dec dx
endm
draw proc
    check:
        get_input
		mov ax, 03h
		int 33h
        paint cx, dx
        jmp check
    ret
draw endp
start:
    mov ax, @data
    mov ds, ax
    call init
	mov ah, 00h ;;check if theres input, then call Draw.
    int 16h
    call draw
    exit:
        mov bx, offset vmode    ;restore video mode on exit
        mov dl, [bx]
        set_vmode dl
        mov ah, 4Ch             ;graceful exit
        int 21h
end start
