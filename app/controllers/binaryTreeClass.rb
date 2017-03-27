class Node
   attr_accessor :data, :leftChild, :rightChild

   def initialize(data)
      @data = data
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

   attr_accessor :head, :result

   # Constructor called when object is created
   def initialize()
      @head = nil # head is a variable only visible in this class?? update check
   end

   def insert(data)
      # Insertion of first node
      node = Node.new(data)
      if @head == nil
         #print "Inserting first node" # debug update remove
         #print "Data = #{node.data}"
         @head = node
      else # Insertion of additional nodes
         #print "Inserting additional node" # debug update remove
      end #if
   end # def insert

   def search(inData)
      if @head.data == inData
         @result = @head.data
      else
         @result = "no"
      end
   end # def search

   def remove(data)
   end # def remove data

   def status
      return @result
   end

end #BinaryTree

$binaryTree = BinaryTree.new
