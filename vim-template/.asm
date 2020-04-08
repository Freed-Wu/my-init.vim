	name %FILE%
	title %FILE%
.radix 10
.model small
.stack 1024
.data
	buffer

.data?

.const

.code
main proc far
start:
	mov ax,@data
	move ds,ax
	mov ss,@stack
	lea ax,buffer

%HERE%

	mov ax,4c00h
	int 21h
main endp

end start

