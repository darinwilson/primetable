#!/usr/bin/env ruby

require './lib/prime_generator'
require './lib/multiplication_table'

table = MultiplicationTable.new(PrimeGenerator.new.get_primes(10))
table.print_table
