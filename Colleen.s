section .data
    fmt db 'section .data%c    fmt db %c%s%c%c%csection .text%c    global start%c    global _main%c    extern _printf%c%cstart:%c    call _main%c%c; c est ici que tout se passe%c_main:%c    push rbp%c    mov rbp, rsp                ; Initialise la stack pour la fonction%c%c    sub rsp, 0x1e0              ; Ajoute de la stack (multiple de 16 obligatoire !)%c%c    lea rdi, [rel fmt]          ; printf format%c%c    ; On utilise les registres pour les premiers args%c    mov rsi, 0xa                ; printf "\n"%c    mov rdx, 0x27               ; printf Quote%c    lea rcx, [rel fmt]          ; printf fmt%c    mov r8, 0x27                ; printf Quote%c    mov r9, 0xa                 ; printf "\n"%c%c    ; Plus de registre disponible, on utilise la stack pour les prochains args%c    mov r10, 0x0                ; Set r10 a 0%c    jmp _set_stack              ; va a set_stack%c%c_set_stack:%c    mov word [rsp+r10], 0xa     ; printf "\n"%c    add r10, 0x8                ; r10 += 8%c    cmp r10, 0x1e0              ; Boucle jusqu a ce que toute la stack soit remplie%c    jl _set_stack%c    jmp _call_printf            ; Fin de boucle, va a call_printf%c%c_call_printf:%c    call _printf                ; Call printf%c%c    add rsp, 0x1e0              ; Rend la stack%c    xor rax, rax                ; Set rax a 0%c%c    leave                       ; reset la stack%c    ret                         ; return (rax);%c'

section .text
    global start
    global _main
    extern _printf

start:
    call _main

; c est ici que tout se passe
_main:
    push rbp
    mov rbp, rsp                ; Initialise la stack pour la fonction

    sub rsp, 0x1e0              ; Ajoute de la stack (multiple de 16 obligatoire !)

    lea rdi, [rel fmt]          ; printf format

    ; On utilise les registres pour les premiers args
    mov rsi, 0xa                ; printf "\n"
    mov rdx, 0x27               ; printf Quote
    lea rcx, [rel fmt]          ; printf fmt
    mov r8, 0x27                ; printf Quote
    mov r9, 0xa                 ; printf "\n"

    ; Plus de registre disponible, on utilise la stack pour les prochains args
    mov r10, 0x0                ; Set r10 a 0
    jmp _set_stack              ; va a set_stack

_set_stack:
    mov word [rsp+r10], 0xa     ; printf "\n"
    add r10, 0x8                ; r10 += 8
    cmp r10, 0x1e0              ; Boucle jusqu a ce que toute la stack soit remplie
    jl _set_stack
    jmp _call_printf            ; Fin de boucle, va a call_printf

_call_printf:
    call _printf                ; Call printf

    add rsp, 0x1e0              ; Rend la stack
    xor rax, rax                ; Set rax a 0

    leave                       ; reset la stack
    ret                         ; return (rax);
