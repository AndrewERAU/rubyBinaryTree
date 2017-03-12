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
   else # TODO: This is always executing... Why???
      puts "Invalid input!"
   end
end

class Node
   attr_accessor :key, :value, :leftChild, :rightChild

   def initialize
      print "Key (enter a string used as the key of the new node): "
      @key = gets.chomp
      print "Value (enter a string used as the key of the new node): "
      @value = gets.chomp
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
         print "Key = #{node.key}, Value = #{node.value}"
      else # Insertion of additional nodes
         print "Inserting additional node" # debug update remove
      end #if
   end #insert

end #BinaryTree

main

print "\n\n"
