NUMBER = Transform /[\d,.]+/ do |number|
  if number['.']
    number.to_f
  else
    number.to_i
  end
end
