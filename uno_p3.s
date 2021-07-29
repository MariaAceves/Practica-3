//Defining a global variable in data segment of word type
	.data			//Data Segment
		sum:		//Variable Name
	.word 14		//Variable Size and Initial Value

	.data
		i:
	.word 0


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

	ldr r0, =sum	//Se carga la dirección de sum/
	ldr r0, [r0]	//Se obtiene el valor de la variable sum/
	ldr r1, =i		//Se carga la dirección de i/
	ldr r1, [r1]	//Se obtine el valor de la variable i/
	cmp r0, r1		//Se compara sum e i/
	bne Loop		//Se salta al 'for' si la comparación es falsa/
	b Continue		//Continuna si no es menor/

Loop:
		add r1, #1	//Se suma uno a i, app/
		nop
		add r1, #1	//Se suma el 1 del for/
		cmp r0, r1	//Se compara sum e i/
		bgt Loop	//Loop/
		b Continue
Continue:
	mov	r3, #0
	mov	r0, r3
	pop {r3, pc}

	.align	2

.L3:
	.word	.LC0
	.end
