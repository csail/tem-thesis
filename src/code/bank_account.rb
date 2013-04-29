def bank_account(account_number)
  balance = 0
  account = Hash.new
  account[:balance] = lambda { balance }
  account[:number] = lambda { account_number }
  account[:deposit] = lambda { |amount| balance += amount }
  account[:withdraw] = lambda { |amount| balance -= amount }
end