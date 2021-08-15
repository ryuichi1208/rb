1000.times {
  File.open("/bin/sh", "r") {}
}

def time1
  puts syscall(186)
  sleep(4)
  puts Time.now.strftime("%H時%M分%S秒")
end

def time2
  puts syscall(102)
  sleep(4)
  puts Time.now.strftime("%H時%M分%S秒")
end

threads = []
threads << Thread.new { time1() }
puts "main: #{Time.now.strftime("%H時%M分%S秒")}"
threads << Thread.fork { time2() }
puts "main: #{Time.now.strftime("%H時%M分%S秒")}"
threads << Thread.fork { time2() }
threads.each { |thr| thr.join }
