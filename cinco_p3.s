//Defining a global variable in data segment of word type/
	.data			//Data Segment/
		bNumber1:	//Variable Name/
	.word 5			//Variable Size and Initial Value/

	.data			//Data Segment/
		bNumber2:	//Variable Name/
	.word 5	//Variable Size and Initial Value/

	.data			//Data Segment/
		ubCounter:	//Variable Name/
	.word 0		    //Variable Size and Initial Value/

	.text
	.section	.rodata
	.align	2
.LC0:

//Defining a global variable in data segment of word type/
.text						//Memory segment where the function will be placed/
.align	2					//Memory aligment set to 16 Bit/
.global	main				//Function name/
.type main function			//Specifying main as function/


main:
	push {r3, lr}
	add	r3, sp, #4

	ldr r0, =bNumber1		//Se carga la dirección de bNumber1/
	ldr r0, [r0]			//Se obtiene el valor de la variable bNumber1/
	ldr r1, =bNumber2		//Se carga la dirección de bNumber2/
	ldr r1, [r1]			//Se obtiene el valor de la variable bNumber2/

	bl vfnCompareNumbers	//Llamada a la función/

	mov	r3, #0
	mov	r0, r3
	pop {r3, pc}


	.align 2
	.type vfnCompareNumbers  function
	vfnCompareNumbers:
	cmp r0, r1
	blt n1menor			//r0 < r1/
	beq iguales			//r0 = r1/
	b	elsee

	n1menor:
	ldr r3, =ubCounter
	ldr r4, [r3]
	add r4, #1
	str r4, [r3]
	b fin

	iguales:
	ldr r3, =ubCounter
	add r0, r1
	str r0, [r3]
	b fin

	elsee:
	ldr r3, =ubCounter
	ldr r4, [r3]
	sub r4, #1
	str r4, [r3]
	b fin

	fin:
	b vfnCompareNumbers



	.align	2
.L3:
	.word	.LC0
	.end
