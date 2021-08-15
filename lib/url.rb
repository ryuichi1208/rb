def e(str)
  p str.gsub(/\)/, "").gsub(/\.$/, "").gsub(/\,$/, "")
end

e("https://github.com/docker/node-sdk/workflows/CI/badge.svg)")
e("https://github.com/docker/node-sdk/workflows/CI/badge.svg).")
e("https://github.com/docker/node-sdk/workflows/CI/badge.svg),")
