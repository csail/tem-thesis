case 0x2:
	// conditionals
	switch(opcode & 0x0f) {					
	case 0x01:	// jz, je	(jump if zero)
	case 0x06:	// jnz, jne  (jump if non-zero)
	case 0x02:	// ja, jg	(jump if above zero)
	case 0x03:	// jae, jge	(jump if above or equal to zero)
	case 0x04:	// jb, jl	(jump if below zero)
	case 0x05:	// jbe, jle	(jump if below or equal to zero)
	case 0x07:	// jmp	(jump)
		if(opcode != 0x27) {
			// jmp doesn't need a stack value, everything else does
			sp -= (short)2; operand1 = Util.getShort(pBuffer, sp);
		}
		operand2 = Util.getShort(pBuffer, ip); ip += 2;
		condition = false;
		if((opcode & 0x01) != 0) condition |= (operand1 == (short)0);
		if((opcode & 0x02) != 0) condition |= (operand1 > (short)0);
		if((opcode & 0x04) != 0) condition |= (operand1 < (short)0);					
		if(condition)
			ip += operand2;
		break;
	default:	// undefined
	}
	break;
