arr = ["aaa", "bbb", "ccc"]
p arr.map(&:upcase)
p arr.map(&:capitalize)
if arr.delete("aaa")
  p "true"
end
if arr.delete("ddd")
  p "false"
end

class Test
 attr_reader :math, :society

  def initialize(math, society)
    @math = math
    @society = society
  end
end

result = Test.new("90点", "100点")
puts(result.math)
puts(result.society)

def _add(a)
  a**2
end

a = [1,2,3,4,5]
p a.map{|b| _add b}.map{|c| c -1 }
