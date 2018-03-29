section .data
    fmt db '%s', 10
    msg db 'section .data'

section .text
    global start
    global _main
    extern _printf

start:
    call _main

_main:
    mov rax, offset data
    push rax
    mov rax, offset data
    push rax
    call _printf
    pop rbx
    pop rbx
    ret
