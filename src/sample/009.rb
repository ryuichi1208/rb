a = [1,2,3,4,5]
a = a.map{|n| n*2}
puts a
a = a.select{|n| n.even?}
puts a
