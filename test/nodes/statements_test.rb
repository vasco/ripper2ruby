require File.dirname(__FILE__) + '/../test_helper'

class StatementsTest < Test::Unit::TestCase
  include TestHelper

  define_method :"test a body with a single call, no semicolon" do
    src = 'foo'
    assert_equal src, build(src).to_ruby
  end
  
  define_method :"test a body with a single call, lefthand semicolon" do
    src = ';foo'
    assert_equal src, build(src).to_ruby
  end
  
  define_method :"test a body with a single call, righthand semicolon" do
    src = 'foo;'
    assert_equal src, build(src).to_ruby
  end
  
  define_method :"test a body with a single call, two semicolons" do
    src = ';foo;'
    assert_equal src, build(src).to_ruby
  end
  
  define_method :"test a body with a few calls and a few semicolons (1)" do
    src = ';foo;;bar;baz;'
    assert_equal src, build(src).to_ruby
  end
  
  define_method :"test a body with a few calls and a few semicolons (2)" do
    src = ';foo;;bar;;;;baz;'
    assert_equal src, build(src).to_ruby
  end
  
  define_method :"test a body with a few calls and a few semicolons (3)" do
    src = ';;;foo;;bar;baz;;;;'
    assert_equal src, build(src).to_ruby
  end
  
  define_method :"test a nested body with a single call, no semicolon (1)" do
    src = '(foo)'
    assert_equal src, build(src).to_ruby
  end
  
  define_method :"test a nested body with a single call, no semicolon (2)" do
    src = '(((foo)); (bar))'
    assert_equal src, build(src).to_ruby
  end
  
  define_method :"test a nested body with a single call, no semicolon (2)" do
    src = '(((foo)); ((bar); (baz)));'
    assert_equal src, build(src).to_ruby
  end
  
  define_method :"test a statement with preceding and succeding whitespace" do
    src = "\n foo \n"
    assert_equal src, build(src).to_ruby
  end
end