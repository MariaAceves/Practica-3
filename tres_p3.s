//Defining a global variable in data segment of word type/
	.data			//Data Segment/
		n:		//Variable Name/
	.word -3		//Variable Size and Initial Value/



	.text
	.section	.rodata
	.align	2
.LC0:

//Defining a global variable in data segment of word type/
.text				//Memory segment where the function will be placed/
.align	2			//Memory aligment set to 16 Bit/
.global	main		//Function name/
.type main function //Specifying main as function/


main:
	push {r3, lr}
	add	r3, sp, #4

	ldr r0, =n		//Se carga la dirección de n/
	ldr r0, [r0]	//Se obtiene el valor de la variable n/
	b Loop		//Se salta al 'do while' si la comparación es falsa/

Loop:
		add r0, #1	//Se suma uno a n/
		nop
		movs r5, #0
		sub r5, #1
		cmp r0, #0
		blt Loop	//Loop
		b Continue

Continue:
	mov	r3, #0
	mov	r0, r3
	pop {r3, pc}

	.align	2
.L3:
	.word	.LC0
	.end
