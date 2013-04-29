def adder(term)
  lambda { |x| x + term }
end
increment = adder(1)
six = increment.call(5)
