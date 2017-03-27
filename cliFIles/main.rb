def main
   binaryTree = BinaryTree.new

   puts "Welcome to the Ruby Binary Tree!"
   puts "What would you like to do?"
   puts "[i] Insert"
   puts "[r] Remove"
   puts "[s] Search"
   puts "[e] Exit"

   print "Choice: "
   choice = gets.chomp #.chomp removes newline

   case choice
   when "i","I"
      newNode = Node.new
      binaryTree.insert(newNode)
   when "r","R"
      null
   when "s","S"
      null
   when "e","E"
      puts "Goodbye!"
      exit(0)
   else
      puts "Invalid input!"
   end
end

class Node
   attr_accessor :data, :leftChild, :rightChild

   def initialize
      @data = setData
      @leftChild = nil
      @rightChild = nil
   end

   def setData
      print "Data (enter an integer used as the data of the new node): "
      return gets.chomp
      # TODO:update, if data is not an integer, say invalid input and ask again for data
   end

end

class BinaryTree

   # Constructor called when object is created
   def initialize()
      @head = nil # head is a variable only visible in this class?? update check
   end

   def insert(node)
      # Insertion of first node
      if @head == nil
         print "Inserting first node" # debug update remove
         print "Data = #{node.data}"
      else # Insertion of additional nodes
         print "Inserting additional node" # debug update remove
      end #if
   end #insert

end #BinaryTree

main

print "\n\n"
