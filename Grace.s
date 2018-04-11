section .data
    fmt db 'section .data%c    fmt db %c%s%c, 0%c    file db %cGrace_kid.s%c, 0%c    mode db %cw+%c, 0%c%csection .text%c    global start%c    global _main%c    extern _fopen%c    extern _fprintf%c    extern _fclose%c%c%%define TRUE 1%c%%define FALSE 0%c%c; c est ici que tout se passe%c%%macro FT 1%c_main:%c    push rbp%c    mov rbp, rsp                ; Initialise la stack pour la fonction%c%c    sub rsp, 0x270              ; Ajoute de la stack (multiple de 16 obligatoire !)%c%c    ; fopen%c    lea rdi, [rel file]         ; fopen path%c    lea rsi, [rel mode]         ; fopen mode%c%c    call _fopen                 ; Call fopen%c%c    ; fprintf%c    mov rdi, rax                ; printf file%c    lea rsi, [rel fmt]          ; printf format%c%c    ; On utilise les registres pour les premiers args%c    mov rdx, 0xa                ; printf "\n"%c    mov rcx, 0x27               ; printf Quote%c    lea r8, [rel fmt]           ; printf fmt%c    mov r9, 0x27                ; printf Quote%c%c    ; Plus de registre disponible, on utilise la stack pour les prochains args%c    mov word [rsp+0x00], 0xa    ; printf "\n"%c    mov word [rsp+0x08], 0x27   ; printf Quote%c    mov word [rsp+0x10], 0x27   ; printf Quote%c    mov word [rsp+0x18], 0xa    ; printf "\n"%c    mov word [rsp+0x20], 0x27   ; printf Quote%c    mov word [rsp+0x28], 0x27   ; printf Quote%c%c    mov r10, 0x30               ; Set r10 a 0x30%c    jmp _set_stack              ; va a set_stack%c%c_set_stack:%c    mov word [rsp+r10], 0xa     ; printf "\n"%c    add r10, 0x8                ; r10 += 8%c    cmp r10, 0x260              ; Boucle jusqu a ce que toute la stack soit remplie%c    jl _set_stack%c    jmp _call_fprintf           ; Fin de boucle, va a call_printf%c%c_call_fprintf:%c    mov [rsp+0x260], rdi        ; Sauve rdi sur la stack%c    call _fprintf               ; Call printf%c    mov rdi, [rsp+0x260]        ; Charge rdi depuis la stack%c    call _fclose                ; Call fclose%c%c    add rsp, 0x270              ; Rend la stack%c    xor rax, rax                ; Set rax a 0%c%c    leave                       ; reset la stack%c    ret                         ; return (rax);%c%%endmacro%c%cstart:%c    FT xxxxxx%c', 0
    file db 'Grace_kid.s', 0
    mode db 'w+', 0

section .text
    global start
    global _main
    extern _fopen
    extern _fprintf
    extern _fclose

%define TRUE 1
%define FALSE 0

; c est ici que tout se passe
%macro FT 1
_main:
    push rbp
    mov rbp, rsp                ; Initialise la stack pour la fonction

    sub rsp, 0x270              ; Ajoute de la stack (multiple de 16 obligatoire !)

    ; fopen
    lea rdi, [rel file]         ; fopen path
    lea rsi, [rel mode]         ; fopen mode

    call _fopen                 ; Call fopen

    ; fprintf
    mov rdi, rax                ; printf file
    lea rsi, [rel fmt]          ; printf format

    ; On utilise les registres pour les premiers args
    mov rdx, 0xa                ; printf "\n"
    mov rcx, 0x27               ; printf Quote
    lea r8, [rel fmt]           ; printf fmt
    mov r9, 0x27                ; printf Quote

    ; Plus de registre disponible, on utilise la stack pour les prochains args
    mov word [rsp+0x00], 0xa    ; printf "\n"
    mov word [rsp+0x08], 0x27   ; printf Quote
    mov word [rsp+0x10], 0x27   ; printf Quote
    mov word [rsp+0x18], 0xa    ; printf "\n"
    mov word [rsp+0x20], 0x27   ; printf Quote
    mov word [rsp+0x28], 0x27   ; printf Quote

    mov r10, 0x30               ; Set r10 a 0x30
    jmp _set_stack              ; va a set_stack

_set_stack:
    mov word [rsp+r10], 0xa     ; printf "\n"
    add r10, 0x8                ; r10 += 8
    cmp r10, 0x260              ; Boucle jusqu a ce que toute la stack soit remplie
    jl _set_stack
    jmp _call_fprintf           ; Fin de boucle, va a call_printf

_call_fprintf:
    mov [rsp+0x260], rdi        ; Sauve rdi sur la stack
    call _fprintf               ; Call printf
    mov rdi, [rsp+0x260]        ; Charge rdi depuis la stack
    call _fclose                ; Call fclose

    add rsp, 0x270              ; Rend la stack
    xor rax, rax                ; Set rax a 0

    leave                       ; reset la stack
    ret                         ; return (rax);
%endmacro

start:
    FT xxxxxx
