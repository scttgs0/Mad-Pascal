
	opt l-c+

/*
	RCASM
	RCDATA
*/


/* ----------------------------------------------------------------------- */
/* RCASM
/* ----------------------------------------------------------------------- */

.macro	RCASM (nam, lab)

	ift main.%%lab>=CODEORIGIN && main.%%lab<PROGRAMSTACK
	ert 'Overlap memory'
	eif

	org main.%%lab
len_

	icl %%1

len = * - len_

	.print '$R RCASM   ',main.%%lab,'..',main.%%lab+len-1," %%1"
.endm


/* ----------------------------------------------------------------------- */
/* RCDATA
/* ----------------------------------------------------------------------- */

.macro	RCDATA (nam, lab, ofs)

	ift main.%%lab>=CODEORIGIN && main.%%lab<PROGRAMSTACK
	ert 'Overlap memory'
	eif

	org main.%%lab

        .def :main.%%lab.start = *
	ins %%1,%%ofs
        .def :main.%%lab.size = * - :main.%%lab.start

	.print '$R RCDATA  ',main.%%lab,'..',*-1," %%1"
.endm

	opt l+
