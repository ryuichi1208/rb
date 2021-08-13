print(self.to_s)
print(self.to_s)
print(self.class.to_s)

hash = {"0" => 2, "1" => "b"}
puts hash["0"]

hash = {"Yamada" => 34, "Katou" => 28, "Endou" => 18}

print(hash["Katou"])
print(hash.fetch("Katou"))

require "kconv"

hash = Hash["Yamada" => "Tokyo", "Katou" => "Osaka", "Endou" => "Fukuoka"]

print(Kconv.tosjis("コピー元¥n"))
hash.each do |key, val|
  print("key:", key.object_id, ", val:", val.object_id, "¥n")
end

print(Kconv.tosjis("コピー先¥n"))
copyhash = Hash[hash]
copyhash.each do |key, val|
  print("key:", key.object_id, ", val:", val.object_id, "\n")
end

hash = Hash.new("none")
print(hash["Yamada"])

h = {0 => "a", 1 => "b"}
h.each do |k,v|
  puts k, v
end

l = [1,2,3,4,5]
l.each do |i|
  puts i
end

require "kconv"

addressh1 = Hash.new("none")
addressh1["Itou"] = "Tokyo"

print(Kconv.tosjis("住所 : "), addressh1["Itou"], "¥n")
print(Kconv.tosjis("住所 : "), addressh1["Yamada"], "¥n")

print("¥n");

addressh2 = Hash.new{|hash, key|
  hash[key] = key
}

print(Kconv.tosjis("住所 : "), addressh2["Yamada"], "¥n")
print(Kconv.tosjis("住所 : "), addressh2["Takahashi"], "¥n")
print(Kconv.tosjis("要素数 : "),addressh2.length(), "¥n")

addressh3 = Hash.new{|hash, key|
  key
}

print("¥n");

print(Kconv.tosjis("住所 : "), addressh3["Yamada"], "¥n")
print(Kconv.tosjis("住所 : "), addressh3["Takahashi"], "¥n")
print(Kconv.tosjis("要素数 : "),addressh3.length(), "¥n")

print("¥n");

addressh4 = Hash.new("none")

print(Kconv.tosjis("住所 : "), addressh4["Itou"], "¥n")
print(Kconv.tosjis("住所 : "), addressh4.fetch("Yamada", "nothing"), "¥n")
print(Kconv.tosjis("住所 : "), addressh4.fetch("Endou"){|key|key}, "¥n")

print("¥n");

addressh5 = Hash.new()
addressh5.default = "none"
print(Kconv.tosjis("住所 : "), addressh5["Yamada"], "¥n")
