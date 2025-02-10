#!/usr/bin/env ruby

require 'mysql2'
require 'date'
require 'active_support/all'
require 'optparse'

options = {}
optparse = OptionParser.new do |opts|
	opts.banner = "Usage: lazy_tweak.rb [-c company] [-p period] [-v] [-w]"

	opts.on( '-c', '--company [company]', Integer, 'Select company' ) do |company|
		options[:company] = company
	end
	opts.on( '-p', '--period [period]', Integer, 'Select period' ) do |period|
		options[:period] = period
	end

	opts.on( '-h', '--help', 'Shows this help' ) do
		puts opts
		exit
	end		
end

optparse.parse!

puts optparse
puts

connect = Mysql2::Client.new(
  :host => "127.0.0.1",
  :port => 33306,
  :username => "lazy8",
  :password => "lazy8",
  :database => "lazy8",
  :encoding => 'latin1')

puts "Companies (select with -c)"
result = connect.query("SELECT * FROM Company", :symbolize_keys => true)
result.each do |x| 
  #puts x
  puts "#{x[:id]}: #{x[:name]}"
end
puts

unless options[:company] 
	exit
end

puts "Periods (select with -p)"
result = connect.query("SELECT * FROM Period WHERE companyId=#{options[:company]}", :symbolize_keys => true)
result.each do |x|
  #puts x
  puts "#{x[:id]}: #{x[:dateStart]} - #{x[:dateEnd]}"
end
puts

