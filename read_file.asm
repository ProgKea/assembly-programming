format ELF64 executable
entry start

include 'common.inc'

macro read file_descriptor, buffer, count {
    syscall 0, buffer, count
}

macro write file_descriptor, buffer, count {
    syscall 1, file_descriptor, buffer, count
}

macro open filename, flags, mode {
    syscall 2, filename, flags, mode
}

macro close file_descriptor {
    syscall 3, file_descriptor
}

macro exit code {
    syscall 60, code
}

segment writeable executable
start:
    open filename, 0
    read 3, buffer, 4
    close 3
    write 1, buffer, 4
    exit 0

segment readable writable
buffer db 4
filename db "input.txt", 0
