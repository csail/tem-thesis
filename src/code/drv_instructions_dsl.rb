opcode(:mdfxb,  0x18, {:name => :size, :type => :ushort},
  {:name => :from, :type => :ushort}, {:name => :to, :type => :ushort})
opcode :mdvb,   0x19
opcode(:mcmpfxb,0x1A, {:name => :size, :type => :ushort},
  {:name => :op1, :type => :ushort}, {:name => :op2, :type => :ushort})
opcode :mcmpvb, 0x1B
opcode(:mcfxb,  0x1C, {:name => :size, :type => :ushort},
  {:name => :from, :type => :ushort}, {:name => :to, :type => :ushort})
opcode :mcvb,   0x1D
