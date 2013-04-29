def gen_bank_account(number, initial_balance, bank_key)
  balance_address = (0...ps_addr_length).map { |i| rand(256) }
  balance_length = 8
  
  balance_sec = assemble do |s|
    s.psrdfxb :addr => :balance_addr, :to => :balance
    s.ldwc :bank_key; s.rdk
    # will output balance + signature(nonce + balance)
    s.dup; s.ldkl; s.ldwc balance_length; s.add; s.outnew    
    s.outfxb :from => :balance, :length => balance_length
    s.ksfxb :from => :nonce, :length => ps_value_length +
            balance_length, :to => 0xffff
    s.halt
    
    s.label :bank_key; s.immed :ubyte, bank_key.to_tem_key
    s.label :balance_addr; s.immed :ubyte, balance_address
    s.label :nonce; s.filler :ubyte, ps_value_length
    s.label :balance_value; s.filler :ubyte, ps_value_length
    s.stack; s.extra 8
  end
end  # ( code for other closures and for the constructor)
