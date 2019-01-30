#
# CS 430 Spring 2019 P2 (Ruby 2)
#
# Test suite
#

require "test/unit"
require_relative "p2.rb"

class P2Test < Test::Unit::TestCase
  
  def test_nodes_int
    assert_equal(1, parse_expr("1").nodes)
  end

  def test_nodes_1p2
    assert_equal(3, parse_expr("1+2").nodes)
  end

  def test_nodes_5t3p1
    assert_equal(5, parse_expr("5*3+1").nodes)
  end

  def test_eval_int
    assert_equal(1, parse_expr("1").eval)
  end

  def test_eval_add
    assert_equal(3, parse_expr("1+2").eval)
  end

  def test_count_ops_1
    assert_equal(3, parse_expr("1+2*4-1").count_ops)
  end

  def test_height_1
    assert_equal(1, parse_expr("1").height)
  end

  def test_height_2
    assert_equal(2, parse_expr("1+2").height)
  end

  def test_postfix_1p2
    assert_equal("1 2 +", parse_expr("1+2").postfix)
  end

  def test_uniq_ints_1p2
    assert_equal([1,2], parse_expr("1+2").uniq_ints)
  end

end
