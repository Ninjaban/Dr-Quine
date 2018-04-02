section .data
    fmt db '%s', 10, 0
    msg db 'section .data', 10, 0

section .text
    global start
    global _main
    extern _printf

start:
    call _main

_main:
    lea rdi, [rel msg]
    call _printf

    ret
