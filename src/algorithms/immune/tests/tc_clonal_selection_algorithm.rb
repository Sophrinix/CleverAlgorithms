# Unit tests for clonal_selection_algorithm.rb

# The Clever Algorithms Project: http://www.CleverAlgorithms.com
# (c) Copyright 2010 Jason Brownlee. Some Rights Reserved. 
# This work is licensed under a Creative Commons Attribution-Noncommercial-Share Alike 2.5 Australia License.

require "test/unit"
require File.expand_path(File.dirname(__FILE__)) + "/../clonal_selection_algorithm"

class TC_ClonalSelectionAlgorithm < Test::Unit::TestCase 
  
  # test the creation of random strings
  def test_random_bitstring
    assert_equal(10, random_bitstring(10).size)
    assert_equal(0, random_bitstring(10).delete('0').delete('1').size)
  end

  # test the approximate proportion of 1's and 0's
  def test_random_bitstring_ratio
    s = random_bitstring(1000)
    assert_in_delta(0.5, (s.delete('1').size/1000.0), 0.05)
    assert_in_delta(0.5, (s.delete('0').size/1000.0), 0.05)
  end
  
  # TODO write tests
  
  
  # helper for turning off STDOUT
  # File activesupport/lib/active_support/core_ext/kernel/reporting.rb, line 39
  def silence_stream(stream)
    old_stream = stream.dup
    stream.reopen('/dev/null')
    stream.sync = true
    yield
  ensure
    stream.reopen(old_stream)
  end
  
  # test that the algorithm can solve the problem
  def test_search    
    best = nil
    silence_stream(STDOUT) do
      best = search([[-5,5],[-5,5]], 100, 100, 0.1, 2.5, 1)
    end  
    assert_not_nil(best[:cost])
    assert_in_delta(0.0, best[:cost], 0.5)
  end
  
end
