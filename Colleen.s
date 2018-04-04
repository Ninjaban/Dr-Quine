section .data
    fmt db 'fmt : %s%c%c%c%c%c', 0
    msg db 'section .data', 10, 0

section .text
    global start
    global _main
    extern _printf

start:
    call _main

_main:
    push rbp
    mov rbp, rsp        ; Initialise la stack pour la fonction

    sub rsp, 16         ; Ajoute de la stack (multiple de 16 obligatoire !)

    xor rax, rax        ; reset rax to 0
    add rax, 0x30       ; '0' in printf format

    lea rdi, [rel fmt]  ; printf format

    lea rsi, [rel msg]  ; printf %s
    mov rdx, rax
    mov rcx, rax
    mov r8, rax
    mov r9, rax

;    mov (rsp), 0x30        ; add the value to the stack ?

    call _printf        ; Call printf

    xor rax, rax        ; reset rax to 0

    add rsp, 16         ; Rend la stack

    leave               ; reset la stack
    ret                 ; return (rax);
