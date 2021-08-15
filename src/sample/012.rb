arr = ["aaa", "bbb", "bbb", "ccc"]
p arr.uniq!
p arr.select{|n| n.upcase}
p arr.map{|n| n.upcase}
