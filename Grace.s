section .data
    fmt db 'section .data%c    fmt db %c%s%c, 0%c    file db %cGrace_kid.s%c, 0%c    mode db %cw+%c, 0%c%csection .text%c    global start%c    global _main%c    extern _fopen%c    extern _fprintf%c    extern _fclose%c%c%%define TRUE 1%c%%define FALSE 0%c%%define ERROR 2%c%c; c est ici que tout se passe%c%%macro FT 1%c_main:%c    push rbp%c    mov rbp, rsp%c%c    sub rsp, 0x270%c%c    lea rdi, [rel file]%c    lea rsi, [rel mode]%c%c    call _fopen%c%c    mov rdi, rax%c    lea rsi, [rel fmt]%c%c    mov rdx, 0xa%c    mov rcx, 0x27%c    lea r8, [rel fmt]%c    mov r9, 0x27%c%c    mov word [rsp+0x00], 0xa%c    mov word [rsp+0x08], 0x27%c    mov word [rsp+0x10], 0x27%c    mov word [rsp+0x18], 0xa%c    mov word [rsp+0x20], 0x27%c    mov word [rsp+0x28], 0x27%c%c    mov r10, 0x30%c    jmp _set_stack%c%c_set_stack:%c    mov word [rsp+r10], 0xa%c    add r10, 0x8%c    cmp r10, 0x260%c    jl _set_stack%c    jmp _call_fprintf%c%c_call_fprintf:%c    mov [rsp+0x260], rdi%c    call _fprintf%c    mov rdi, [rsp+0x260]%c    call _fclose%c%c    add rsp, 0x270%c    xor rax, rax%c%c    leave%c    ret%c%%endmacro%c%cstart:%c    FT xxxxxx%c', 0
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
%define ERROR 2

; c est ici que tout se passe
%macro FT 1
_main:
    push rbp
    mov rbp, rsp

    sub rsp, 0x270

    lea rdi, [rel file]
    lea rsi, [rel mode]

    call _fopen

    mov rdi, rax
    lea rsi, [rel fmt]

    mov rdx, 0xa
    mov rcx, 0x27
    lea r8, [rel fmt]
    mov r9, 0x27

    mov word [rsp+0x00], 0xa
    mov word [rsp+0x08], 0x27
    mov word [rsp+0x10], 0x27
    mov word [rsp+0x18], 0xa
    mov word [rsp+0x20], 0x27
    mov word [rsp+0x28], 0x27

    mov r10, 0x30
    jmp _set_stack

_set_stack:
    mov word [rsp+r10], 0xa
    add r10, 0x8
    cmp r10, 0x260
    jl _set_stack
    jmp _call_fprintf

_call_fprintf:
    mov [rsp+0x260], rdi
    call _fprintf
    mov rdi, [rsp+0x260]
    call _fclose

    add rsp, 0x270
    xor rax, rax

    leave
    ret
%endmacro

start:
    FT xxxxxx
