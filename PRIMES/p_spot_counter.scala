//
//     Prime Spot Counter --- for Scala2
//
// usage: SCRIPT:  scala p_spot_counter.scala 182226896240
//                 scala p_spot_counter.scala 190830000000 473
//        COMPILE: scalac p_spot_counter.scala
//                 scala p_spot_counter 182226896240
//                 scala p_spot_counter 190830000000 473

import scala.collection.mutable.ListBuffer

object p_spot_counter
{
  var primes = ListBuffer[Long]()

  def main(args :Array[String]) :Unit =
  {
    var start :Long = 3
    var spotsize :Long = 0

    if (args.length >= 2)
    {
      spotsize = args(1).toLong
    }
    if (args.length >= 1)
    { 
      start = args(0).toLong
    }
    if (start % 2 == 0)
    {
      start += 1
    }

    (3L to 1000000L by 2).foreach {n =>
      if (isPrime(n))
      {
        primes += n
      }
    }

    val end :Long = 1000000000000L
    var n :Long = start
    var currSize :Long = spotsize
    var spotStart :Long = 0
    var spotEnd :Long = 0
    var spotSize :Long = 0
    var inSpot :Boolean = false

    while (n < end)
    {
      if (n % 10000000 == 1)
      {
        println(s"---------------------------------------- ${n - 1}")
      }
      // primes
      if (isPrime(n))
      {
        // Spot End
        if (inSpot)
        {
          inSpot = false
          spotEnd = n
          spotSize = spotEnd - spotStart
          if (spotSize >= currSize)
          {
            currSize = spotSize
            println(s"${spotStart - 1}\t\t SpotSize = ${spotSize + 1}")
          }
        }
      }
      // Non primes (in Spot)
      else
      {
        if (!inSpot)
        {
          inSpot = true
          spotStart = n
        }
      }
    // next
    n += 2
    }
  }

  def isPrime(n :Long) :Boolean =
  {
    primes.foreach {p =>
      if ((p * p) > n)
      {
        return true
      }
      if ((n % p) == 0)
      {
        return false
      }
    }
    return true
  }
}
