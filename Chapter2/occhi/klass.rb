klass = Class.new{ |c|
  # Classクラスのインスタンスが帰ってくる
  # irb(#<Class:0x000000014692f058>):012:0> c
  # => #<Class:0x000000014692f058>
  binding.irb
  puts c

  def initialize
    p "in initialize"
  end

  def hoge
    p "hoge hoge hoge"
  end
}

klass.new
