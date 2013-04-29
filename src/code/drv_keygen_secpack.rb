def tk_gen_key(type = :asymmetric, authz = nil)
  gen_sec = assemble do |s|
    s.ldbc authz.nil? ? 24 : 4
    s.outnew
    if authz.nil?
      # no authorization given, must generate one
      s.ldbc 20
      s.ldwc :key_auth
      s.dupn :n => 2; s.rnd; s.outvb
    end
    s.genkp :type => (type == :asymmetric) ? 0x00 : 0x80
    s.authk :auth => :key_auth
    s.outw
    s.authk :auth => :key_auth 
    s.outw
    s.halt
    s.label :key_auth
    if authz.nil?
      s.filler :ubyte, 20
    else
      s.immed :ubyte, authz
    end
    s.stack; s.extra 8
  end
  # ( boring code ommitted )
end