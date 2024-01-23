format ELF64 executable
entry start

include 'common.inc'

segment readable executable

start:
    int3
    mov cx, 0
    jmp condition
loop_start:
    inc cx
    push cx
    syscall 1, 1, msg, msg_len
    pop cx
condition:
    cmp cx, 50
    jle loop_start

    syscall 60, 0

segment readable writable
msg db "Hello, World", 0xA
msg_len = $-msg
