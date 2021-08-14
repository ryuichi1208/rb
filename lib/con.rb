#!/usr/bin/env ruby

require "date"

p Date.today

def usage
  puts "usage: #{$PROGRAM_NAME} [domain name]"
  exit 1
end

usage if ARGV.size != 1
domain = ARGV[0]

Signal.trap(:INT) {
  puts "recv sigint"
  exit()
}

srv = {
  LOCAL:           ["192.168.1.1"],
  AdGuard:         ["94.140.14.14", "94.140.15.15", "94.140.14.14"],
  Alternate:       ["76.76.19.19", "76.223.122.150"],
  Baidu:           ["180.76.76.76", "114.114.114.114"],
  Cloudflare:      ["1.1.1.1", "1.0.0.1", "1.1.1.2", "1.1.1.3"],
  CleanBrowsing:   ["185.228.168.9", "185.228.169.9"],
  CyberGhost:      ["38.132.106.139", "194.187.251.67"],
  Comodo_Secure:   ["8.26.56.26", "8.20.247.20"],
  Dyn_Internet:    ["216.146.35.35", "216.146.36.36"],
  Freenom_World:   ["80.80.80.80", "80.80.81.81"],
  Google:          ["8.8.8.8","8.8.4.4"],
  NTT_America:     ["129.250.35.250", "129.250.35.251"],
  Norton:          ["199.85.126.10", "199.85.127.10"],
  OpenDNS:         ["208.67.222.123", "208.67.220.123", "208.67.222.123"],
  OpenNIC:         ["161.97.219.84", "104.168.144.17"],
  puntCAT:         ["109.69.8.51"],
  Quad101_DNS:     ["101.101.101.101", "101.102.103.104"],
  Quad9:           ["9.9.9.9", "149.112.112.112"],
  SafeDNS:         ["195.46.39.39", "195.46.39.40"],
  SkyDNS:          ["193.58.251.251"],
  Sprintlink:      ["204.117.214.10", "199.2.252.10", "204.97.212.10"],
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
