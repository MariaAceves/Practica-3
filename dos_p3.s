//Defining a global variable in data segment of word type
	.data			//Data Segment
		n:		//Variable Name
	.word 0		//Variable Size and Initial Value

	.text
	.section	.rodata
	.align	2
.LC0:

//Defining a global variable in data segment of word type
.text				//Memory segment where the function will be placed
.align	2			//Memory aligment set to 16 Bit
.global	main		//Function name
.type main function //Specifying main as function


main:
	push {r3, lr}
	add	r3, sp, #4

	ldr r0, =n		//Se carga la dirección de n
	ldr r0, [r0]	//Se obtiene el valor de la variable n
	b Loop		//Se salta al 'while'(loop) si la comparación es falsa
	b Continue		//Continuna si no es menor

Loop:

		cmp r0,#0
		beq Continue
		sub r0, #1	//Se resta uno a n
		nop
		bne Loop//Loop
		b Continue

Continue:
	mov	r3, #0
	mov	r0, r3
	pop {r3, pc}

	.align	2
.L3:
	.word	.LC0
	.end
