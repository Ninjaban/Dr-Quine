section .data
    fmt db 'section .data%c    fmt db %c%s%c, 0%c    i equ %d%c    file db %cSully_%%d.s%c, 0%c    mode db %cw+%c, 0%c    compile1 db %cnasm -f macho64 %%s%c, 0%c    compile2 db %cgcc Sully_%%d.o%c, 0%c    launch db %c./a.out%c, 0%c%csection .text%c    global start%c    global _main%c    extern _malloc%c    extern _snprintf%c    extern _fopen%c    extern _fprintf%c    extern _fclose%c    extern _system%c    extern _free%c%cstart:%c    call _main%c%c; c est ici que tout se passe%c_main:%c    push rbp%c    mov rbp, rsp                ; Initialise la stack pour la fonction%c%c    sub rsp, 0x1000             ; Ajoute de la stack (multiple de 16 obligatoire !)%c%c    mov rdi, i%c    cmp rdi, 0%c    je _end                     ; Si i == 0 va a _end%c%c    ; malloc%c    mov rdi, 25                 ; Set rdi a 25%c    call _malloc                ; Call malloc%c%c    ; snprintf%c    mov rdi, rax                ; Met le retour de malloc dans rdi%c    mov [rsp+0x9d0], rdi        ; Sauve le retour de malloc dans la stack%c    mov rsi, 25                 ; Set rsi a 25%c    lea rdx, [rel file]         ; snprintf format%c    mov rcx, i-1                ; snprintf args%c    call _snprintf              ; Call snprintf%c%c    ; fopen%c    mov rdi, [rsp+0x9d0]        ; fopen file%c    lea rsi, [rel mode]         ; fopen mode%c    call _fopen                 ; Call fopen%c%c    ; fprintf%c    mov rdi, rax                ; printf file%c    lea rsi, [rel fmt]          ; printf format%c%c    ; On utilise les registres pour les premiers args%c    mov rdx, 0xa                ; printf "\n"%c    mov rcx, 0x27               ; printf Quote%c    lea r8, [rel fmt]           ; printf fmt%c    mov r9, 0x27                ; printf Quote%c%c    ; Plus de registre disponible, on utilise la stack pour les prochains args%c    mov word [rsp+0x00], 0xa    ; printf "\n"%c    mov word [rsp+0x08], i-1    ; printf decimal%c    mov word [rsp+0x10], 0xa    ; printf "\n"%c    mov word [rsp+0x18], 0x27   ; printf Quote%c    mov word [rsp+0x20], 0x27   ; printf Quote%c    mov word [rsp+0x28], 0xa    ; printf "\n"%c    mov word [rsp+0x30], 0x27   ; printf Quote%c    mov word [rsp+0x38], 0x27   ; printf Quote%c    mov word [rsp+0x40], 0xa    ; printf "\n"%c    mov word [rsp+0x48], 0x27   ; printf Quote%c    mov word [rsp+0x50], 0x27   ; printf Quote%c    mov word [rsp+0x58], 0xa    ; printf "\n"%c    mov word [rsp+0x60], 0x27   ; printf Quote%c    mov word [rsp+0x68], 0x27   ; printf Quote%c    mov word [rsp+0x70], 0xa    ; printf "\n"%c    mov word [rsp+0x78], 0x27   ; printf Quote%c    mov word [rsp+0x80], 0x27   ; printf Quote%c%c    mov r10, 0x88               ; Set r10 a 0x40%c    jmp _set_stack              ; va a set_stack%c%c_set_stack:%c    mov word [rsp+r10], 0xa     ; printf "\n"%c    add r10, 0x8                ; r10 += 8%c    cmp r10, 0x9c0              ; Boucle jusqu a ce que toute la stack soit remplie%c    jl _set_stack%c    jmp _next                   ; Fin de boucle, va a next%c%c_next:%c    mov [rsp+0x9c0], rdi        ; Sauve rdi sur la stack%c    call _fprintf               ; Call printf%c    mov rdi, [rsp+0x9c0]        ; Charge rdi depuis la stack%c    call _fclose                ; Call fclose%c%c    ; malloc%c    mov rdi, 50                 ; Set rsi a 50%c    call _malloc                ; Call malloc%c%c    ; snprintf%c    mov rdi, rax                ; Met de retour de malloc dans rdi%c    mov [rsp+0x9e0], rdi        ; Sauve le retour de malloc dans la stack%c    mov rsi, 50                 ; Set rsi a 50%c    lea rdx, [rel compile1]     ; snprintf format%c    mov rcx, [rsp+0x9d0]        ; snprintf args%c    call _snprintf              ; Call snprintf%c%c    ; malloc%c    mov rdi, 30                 ; Set rsi a 30%c    call _malloc                ; Call malloc%c%c    ; snprintf%c    mov rdi, rax                ; Met de retour de malloc dans rdi%c    mov [rsp+0x9f0], rdi        ; Sauve le retour de malloc dans la stack%c    mov rsi, 30                 ; Set rsi a 30%c    lea rdx, [rel compile2]     ; snprintf format%c    mov rcx, i-1                ; snprintf args%c    call _snprintf              ; Call snprintf%c%c    ; system%c    mov rdi, [rsp+0x9e0]        ; Charge le retour de malloc depuis la stack%c    call _system                ; Call system%c    mov rdi, [rsp+0x9f0]        ; Charge le retour de malloc depuis la stack%c    call _system                ; Call system%c    lea rdi, [rel launch]       ; system command%c    call _system                ; Call system%c%c    ; free%c    mov rdi, [rsp+0x9f0]        ; Charge le retour de malloc depuis la stack%c    call _free                  ; Call free%c    mov rdi, [rsp+0x9e0]        ; Charge le retour de malloc depuis la stack%c    call _free                  ; Call free%c    mov rdi, [rsp+0x9d0]        ; Charge le retour de malloc depuis la stack%c    call _free                  ; Call free%c    jmp _end                    ; va a end%c%c_end:%c    add rsp, 0x1000             ; Rend la stack%c    xor rax, rax                ; Set rax a 0%c%c    leave                       ; reset la stack%c    ret                         ; return (rax);%c', 0
    i equ 5
    file db 'Sully_%d.s', 0
    mode db 'w+', 0
    compile1 db 'nasm -f macho64 %s', 0
    compile2 db 'gcc Sully_%d.o', 0
    launch db './a.out', 0

section .text
    global start
    global _main
    extern _malloc
    extern _snprintf
    extern _fopen
    extern _fprintf
    extern _fclose
    extern _system
    extern _free

start:
    call _main

; c est ici que tout se passe
_main:
    push rbp
    mov rbp, rsp                ; Initialise la stack pour la fonction

    sub rsp, 0x1000             ; Ajoute de la stack (multiple de 16 obligatoire !)

    mov rdi, i
    cmp rdi, 0
    je _end                     ; Si i == 0 va a _end

    ; malloc
    mov rdi, 25                 ; Set rdi a 25
    call _malloc                ; Call malloc

    ; snprintf
    mov rdi, rax                ; Met le retour de malloc dans rdi
    mov [rsp+0x9d0], rdi        ; Sauve le retour de malloc dans la stack
    mov rsi, 25                 ; Set rsi a 25
    lea rdx, [rel file]         ; snprintf format
    mov rcx, i-1                ; snprintf args
    call _snprintf              ; Call snprintf

    ; fopen
    mov rdi, [rsp+0x9d0]        ; fopen file
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
    mov word [rsp+0x08], i-1    ; printf decimal
    mov word [rsp+0x10], 0xa    ; printf "\n"
    mov word [rsp+0x18], 0x27   ; printf Quote
    mov word [rsp+0x20], 0x27   ; printf Quote
    mov word [rsp+0x28], 0xa    ; printf "\n"
    mov word [rsp+0x30], 0x27   ; printf Quote
    mov word [rsp+0x38], 0x27   ; printf Quote
    mov word [rsp+0x40], 0xa    ; printf "\n"
    mov word [rsp+0x48], 0x27   ; printf Quote
    mov word [rsp+0x50], 0x27   ; printf Quote
    mov word [rsp+0x58], 0xa    ; printf "\n"
    mov word [rsp+0x60], 0x27   ; printf Quote
    mov word [rsp+0x68], 0x27   ; printf Quote
    mov word [rsp+0x70], 0xa    ; printf "\n"
    mov word [rsp+0x78], 0x27   ; printf Quote
    mov word [rsp+0x80], 0x27   ; printf Quote

    mov r10, 0x88               ; Set r10 a 0x40
    jmp _set_stack              ; va a set_stack

_set_stack:
    mov word [rsp+r10], 0xa     ; printf "\n"
    add r10, 0x8                ; r10 += 8
    cmp r10, 0x9c0              ; Boucle jusqu a ce que toute la stack soit remplie
    jl _set_stack
    jmp _next                   ; Fin de boucle, va a next

_next:
    mov [rsp+0x9c0], rdi        ; Sauve rdi sur la stack
    call _fprintf               ; Call printf
    mov rdi, [rsp+0x9c0]        ; Charge rdi depuis la stack
    call _fclose                ; Call fclose

    ; malloc
    mov rdi, 50                 ; Set rsi a 50
    call _malloc                ; Call malloc

    ; snprintf
    mov rdi, rax                ; Met de retour de malloc dans rdi
    mov [rsp+0x9e0], rdi        ; Sauve le retour de malloc dans la stack
    mov rsi, 50                 ; Set rsi a 50
    lea rdx, [rel compile1]     ; snprintf format
    mov rcx, [rsp+0x9d0]        ; snprintf args
    call _snprintf              ; Call snprintf

    ; malloc
    mov rdi, 30                 ; Set rsi a 30
    call _malloc                ; Call malloc

    ; snprintf
    mov rdi, rax                ; Met de retour de malloc dans rdi
    mov [rsp+0x9f0], rdi        ; Sauve le retour de malloc dans la stack
    mov rsi, 30                 ; Set rsi a 30
    lea rdx, [rel compile2]     ; snprintf format
    mov rcx, i-1                ; snprintf args
    call _snprintf              ; Call snprintf

    ; system
    mov rdi, [rsp+0x9e0]        ; Charge le retour de malloc depuis la stack
    call _system                ; Call system
    mov rdi, [rsp+0x9f0]        ; Charge le retour de malloc depuis la stack
    call _system                ; Call system
    lea rdi, [rel launch]       ; system command
    call _system                ; Call system

    ; free
    mov rdi, [rsp+0x9f0]        ; Charge le retour de malloc depuis la stack
    call _free                  ; Call free
    mov rdi, [rsp+0x9e0]        ; Charge le retour de malloc depuis la stack
    call _free                  ; Call free
    mov rdi, [rsp+0x9d0]        ; Charge le retour de malloc depuis la stack
    call _free                  ; Call free
    jmp _end                    ; va a end

_end:
    add rsp, 0x1000             ; Rend la stack
    xor rax, rax                ; Set rax a 0

    leave                       ; reset la stack
    ret                         ; return (rax);
