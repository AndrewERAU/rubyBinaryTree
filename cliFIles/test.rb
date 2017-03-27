class MyClass
   attr_accessor :var1, :var2, :var3
   def initialize
      @var1 = setPay
      @var2 = nil
      @var3 = nil
   end

   def setPay
      print "Enter the hourly pay: "
      return gets.chomp
   end
end
c = MyClass.new

puts c.var1
puts c.var2
