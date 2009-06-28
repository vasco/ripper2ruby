require File.dirname(__FILE__) + '/../test_helper'

class SymbolTest < Test::Unit::TestCase
  include TestHelper

  define_method :"test a symbol" do
    src = ':foo'
    symbol = build(src).first
    assert symbol.is_a?(Ruby::Symbol)
    assert_equal :foo, symbol.value
    assert_equal src, symbol.to_ruby
  end
  
  define_method :"test a symbol that is an operator" do
    src = ':!'
    symbol = build(src).first
    assert symbol.is_a?(Ruby::Symbol)
    assert_equal :!, symbol.value
    assert_equal src, symbol.to_ruby
  end
  
  define_method :"test a symbol that is wtf" do
    src = ':-@'
    symbol = build(src).first
    assert symbol.is_a?(Ruby::Symbol)
    assert_equal :-@, symbol.value
    assert_equal src, symbol.to_ruby
  end
  
  define_method :'test a symbol that is also a keyword' do
    src = ":if"
    symbol = build(src).first
    assert symbol.is_a?(Ruby::Symbol)
    assert_equal :if, symbol.value
    assert_equal src, symbol.to_ruby
  end
  
  define_method :"test a symbol that is an array access operator" do
    src = ':[]'
    symbol = build(src).first
    assert symbol.is_a?(Ruby::Symbol)
    assert_equal :[], symbol.value
    assert_equal src, symbol.to_ruby
  end
  
  define_method :"test a symbol that is an array assignment operator" do
    src = ':[]='
    symbol = build(src).first
    assert symbol.is_a?(Ruby::Symbol)
    assert_equal :[]=, symbol.value
    assert_equal src, symbol.to_ruby
  end
  
  define_method :"test a double-quoted dyna-symbol" do
    src = ':"foo.bar"'
    symbol = build(src).first
    assert symbol.is_a?(Ruby::DynaSymbol)
    assert_equal :'foo.bar', symbol.value
    assert_equal src, symbol.to_ruby
  end
  
  define_method :"test a single-quoted dyna-symbol" do
    src = ":'foo.bar'"
    symbol = build(src).first
    assert symbol.is_a?(Ruby::DynaSymbol)
    assert_equal :'foo.bar', symbol.value
    assert_equal src, symbol.to_ruby
  end
  
  define_method :"test a double-quoted dyna-symbol w/ an embedded expression" do
    src = ':"@#{token}"'
    assert_equal src, build(src).first.to_ruby
  end
end