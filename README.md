PrimeTable
==========

This is a simple coding exercise, whose objective is to print out a multiplication table of the first 10 prime numbers with the following considerations:

 * the code may not use the Prime class from the standard library
 * the code should consider speed and complexity, and be ready to handle a table of *N* primes

#### Running the Code

From the top of the project, simply run the following from the command line:

`./prime_table.rb`

The code was written and tested using Ruby 2.0.0 and RSpec 2.14.7 on Mac OS 10.8.5.

#### Implementation

The program is built from two classes: [PrimeGenerator](https://github.com/darinwilson/primetable/blob/master/lib/prime_generator.rb) and [MultiplicationTable](https://github.com/darinwilson/primetable/blob/master/lib/multiplication_table.rb). The implementation approach and trade-offs are explained in the classes' comments headers.

#### Tests

A few simple tests were implemented using [RSpec](http://rspec.info/), and can be run by executing `rspec` from the command line at the top of the project (assuming that RSpec is installed on your system)

