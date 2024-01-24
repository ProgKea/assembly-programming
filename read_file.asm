format ELF64 executable 3
entry start

READ = 0
WRITE = 1
OPEN = 2
MMAP = 9
EXIT = 60

segment writeable executable
start:
   ;; Allocate memory
   mov r10, 0x22
   mov rdx, 3
   mov rsi, 4
   xor rdi, rdi
   mov rax, MMAP
   syscall

   mov r13, rax

   ;; Open File Descriptor
   xor rsi, rsi ; O_RDONLY
   mov rdi, filename
   mov rax, OPEN
   syscall

   ;; Read into buffer
   mov rdx, 4
   mov rsi, r13
   mov rdi, rax
   xor rax, rax
   syscall

   ;; Write buffer to stdout
   mov rdx, 4
   mov rsi, r13
   mov rdi, 1
   mov rax, WRITE
   syscall

   xor rdi, rdi
   mov rax, EXIT
   syscall

segment readable writeable
filename db "input.txt", 0
msg db "Hello, World", 0xa
msg_len = $-msg
buffer db 4
