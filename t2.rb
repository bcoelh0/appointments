
a = [1, 2, 3, 4, 5]

a.each_with_index do |e, i|
  temp_a = a.delete(e)
  val = temp_a.inject(:*)
  a[i] = val
end

puts a
