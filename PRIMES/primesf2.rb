#! /usr/bin/env ruby

def is_prime(x, plist)
  plist.each do |p|
    return true if p * p > x
    return false if x % p == 0
  end
  true
end

primes = []

(3..10000000).step(2) do |x|
  primes << x if is_prime(x, primes)
end

primes = [2] + primes
#p primes
