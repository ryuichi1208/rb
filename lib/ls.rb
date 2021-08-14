require "socket"
require 'yaml'

class FileRW
  puts "classFileRW"

  attr_accessor :path, :ino, :name
  def initialize(path, ino, name)
    @path = path
    @ino = ino
  end
end

def show_files(path)
  Dir.open(path) do |d|
    d.select{ |f| /(\.\.)/ !~ f }
  end
end

arr = []
show_files(".").each do |f|
  stat = File::Stat.new(f)
  arr << FileRW.new(f, stat.ino, f)
  puts "#{f} -> uid: #{stat.uid} ino: #{stat.ino} is_dir #{stat.directory?}"
end

data = open('a.yml', 'r') { |f| YAML.load(f) }
arr[0]::name = data["name"]
puts arr[0].name


