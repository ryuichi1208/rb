require "kconv"

num = 2
num *= 2 while num < 1000
puts num

arr = ["a", "b", "c"]
arr[3] = "d"
arr[2] = "C"
puts arr.length
arr.each { |a|
  puts a
}

array = ["山田", "太郎", "男性", 24]

print(Kconv.tosjis("氏名 : " + array[0] + array[1] + "¥n"))
print(Kconv.tosjis("性別 : " + array[2] + "¥n"))
print(Kconv.tosjis("年齢 : "),array[3], "¥n")
