#!/usr/bin/env ruby


def usage
  puts "usage: #{$PROGRAM_NAME} [domain name]"
  exit 1
end

usage if ARGV.size != 1
domain = ARGV[0]

srv = {
  _1_1_1_1:        ["1.1.1.1", "1.0.0.1"],
  AdGuard:         ["94.140.14.14", "94.140.15.15", "94.140.14.14"],
  Baidu:           ["180.76.76.76", "114.114.114.114"],
  CleanBrowsing:   ["185.228.168.9", "185.228.169.9"],
  Comodo_Secure:   ["8.26.56.26", "8.20.247.20"],
  Dyn_Internet:    ["216.146.35.35", "216.146.36.36"],
  Freenom_World:   ["80.80.80.80", "80.80.81.81"],
  Google:          ["8.8.8.8","8.8.4.4"],
  OpenDNS:         ["208.67.222.123", "208.67.220.123", "208.67.222.123"],
  OpenNIC:         ["161.97.219.84", "104.168.144.17"],
  Quad101_DNS:     ["101.101.101.101", "101.102.103.104"],
  Quad9:           ["9.9.9.9", "149.112.112.112"],
  UltraRecursive:  ["156.154.70.1", "156.154.71.1"],
  Verisign_Public: ["64.6.64.6", "64.6.65.6"],
  Yandex_DNS:      ["77.88.8.8", "77.88.8.1"],
}

srv.each do |k, v|
  v.each do |s|
    puts "===== #{k}: #{s} ====="
    res = `dig #{domain} @#{s} | awk '/Query/ {print $4}'`.gsub("\n", "").to_i
    case res
    when 0..500
      puts "\e[32mQueryTime: #{res} [ms]\e[0m"
    when 501..999
      puts "\e[31mQueryTime: #{res} [ms]\e[0m"
    else
      puts "\e[41mQueryTime: #{res} [ms]\e[0m"
    end
    system("dig #{domain} @#{s} +short", exception: true)
    puts
  end
end
