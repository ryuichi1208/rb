d = 10
e = 20
print((d + e).to_s + "\n")

str = "Tokyo"
str << ",Japan"
puts str

calc1 = 20 * 15
calc2 = 30 - 18
print("20 * 15 = ", calc1, ", 30 - 18 = ", calc2,  "¥n")

# コメント
print("aaa\n") # コメント2

=begin
ドキュメント
ドキュメント
ドキュメント
=end

puts("Hello"); puts("World")

a = String.new("def")
puts a

b = <<TEXT
aaa
bbb
ccc
TEXT

puts "#{b}"

puts STDIN
puts STDOUT
puts STDERR
puts ENV
puts ARGF
puts ARGV
puts DATA
puts TOPLEVEL_BINDING
puts RUBY_VERSION
puts RUBY_RELEASE_DATE
puts RUBY_PLATFORM
puts RUBY_PATCHLEVEL
