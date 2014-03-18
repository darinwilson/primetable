# A rudimentary prime number generator. The implementation uses an incremental variation
# of The Sieve of Eratosthenes so that primes can be easily generated with no upper bound.
# The algorithm is described here: http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
#
# The Sieve is not the fastest way to generate primes, and this is a non-optimized version
# of the incremental algorithm, but it should work reasonably well for small- to 
# medium-sized sets.
#
# Usage:
#
# iteration:
#   # prints all primes up to 1000
#   PrimeGenerator.new.each do |prime|
#     p prime
#     break if prime > 1000
#   end
#
# fetching a specific number of primes
#   # creates an Array containing the first 100 primes
#   prime_array = PrimeGenerator.new.get_primes(100)
#
class PrimeGenerator 
  
  def get_primes(number_of_primes)
    primes = []
    self.each do |prime| 
      primes << prime
      return primes if primes.length >= number_of_primes
    end
  end

  def each
    # This hash holds the primes that we've found, and the next anticipated multiples of
    # those primes. When we encounter a number that's not in the hash, we know it's a 
    # prime, and it's added to the hash. When we encounter a number that is in the hash,
    # we bump the number up to the next multiple and keep looking
    prime_multiples = {}
    current = 1
    while true
      current = find_next_prime(current, prime_multiples)
      yield current
    end
  end

  private

  def find_next_prime(number, prime_multiples)
    while true
      number += 1
      return number if prime?(number, prime_multiples)
    end
  end

  def prime?(number, prime_multiples)
    if prime_multiples.has_key?(number)
      # not a prime
      reset_multiples_for(number, prime_multiples)
      return false
    else
      # it's a prime - add it to the multiples hash
      add_multiple(prime_multiples, number**2, number)
      return true
    end
  end

  def reset_multiples_for(number, prime_multiples)
    # remove the multiple from the map, and for each prime that was a factor of the
    # given number, add their next multiple
    prime_factors = prime_multiples.delete(number)
    prime_factors.each do |prime_factor| 
      add_multiple(prime_multiples, number + prime_factor, prime_factor)
    end
  end

  def add_multiple(prime_multiples, key, value)
    if prime_multiples[key] 
      prime_multiples[key] << value
    else
      prime_multiples[key] = Array(value)
    end
  end

end
