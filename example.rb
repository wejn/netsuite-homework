#!/usr/bin/env ruby

require_relative 'lib/netsuite-homework'

max = ((__FILE__ == $0 ? ARGV.first : nil) || 10+rand(50)).to_i
ar = (1..max).sort_by { rand }

puts "Input: " + ar.inspect
puts "Sorted: " + ar.sort.inspect

puts
puts "Default run: " + NetsuiteHomework.new.apply(ar).inspect

for n in [4, 5, 3, 7]
	puts
	puts "#{n} smallest: " + NetsuiteHomework.new(n, :<).apply(ar).inspect
	puts "#{n} biggest: " + NetsuiteHomework.new(n, :>).apply(ar).inspect
end
