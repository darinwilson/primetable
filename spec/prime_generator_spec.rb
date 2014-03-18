require_relative 'spec_helper'
require_relative '../lib/prime_generator'

describe PrimeGenerator do

  # source: http://en.wikipedia.org/wiki/List_of_prime_numbers
  FIRST_100_PRIMES = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,
    73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,
    179,181,191,193,197,199,211,223,227,229,233,239,241,251,257,263,269,271,277,281,
    283,293,307,311,313,317,331,337,347,349,353,359,367,373,379,383,389,397,401,409,
    419,421,431,433,439,443,449,457,461,463,467,479,487,491,499,503,509,521,523,541]

  let(:prime_generator) { PrimeGenerator.new }

  # we'll assume that if our algorithm can generate the first 100 primes, then it's working 
  it "iterates through all prime numbers" do
    primes = []
    prime_generator.each do |prime| 
      primes << prime
      break if primes.size == 100
    end
    expect(primes).to eq(FIRST_100_PRIMES)   
  end

  it "returns a specified number of primes" do
    expect(prime_generator.get_primes(30)).to eq(FIRST_100_PRIMES[0,30]) 
  end

end
