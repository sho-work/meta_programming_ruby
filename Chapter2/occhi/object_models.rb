require 'bundler/inline'
gemfile do
  source 'https://rubygems.org'
  gem 'pry-byebug'
end

class MyClass
  def my_method
    @value = 'hogehoge'
  end
end

obj = MyClass.new
obj.my_method
puts obj.instance_variables

obj.methods.grep(/my/)
