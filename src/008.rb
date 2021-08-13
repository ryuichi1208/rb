a = [1,2,3,4,5]
a.delete_if do |n|
  #n.odd?
  false
end

puts a

b = 1..3
b.each do |n|
  puts n
end


