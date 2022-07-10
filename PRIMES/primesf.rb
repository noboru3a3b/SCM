#! /usr/bin/env ruby

def is_prime(x, prime_list)
  prime_list.each do |p|
    return true if p * p > x
    return false if x % p == 0
  end
  true
end

primes = []

3.step(100000000, 2) do |x|
  primes.push(x) if is_prime(x, primes)
end

primes = [2] + primes
#p primes
