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
      newNode = Node.new(data)

      trvPtr = @head

      if @head == nil
         @head = newNode
      else # Insertion of additional nodes
         while trvPtr != nil
            trvPtrParent = trvPtr
            if newNode.data < trvPtr.data
               trvPtr = trvPtr.leftChild
               if trvPtr == nil
                  trvPtrParent.leftChild = newNode
               end #if
            else
               trvPtr = trvPtr.rightChild
               if trvPtr == nil
                  trvPtrParent.rightChild = newNode
               end #if
            end #if
         end #while
      end #if
   end # def insert

   def search(inData) # set @result
      trvPtr = @head

      while (trvPtr != nil) && (inData != trvPtr.data)
         if inData < trvPtr.data
            trvPtr = trvPtr.leftChild
         elsif inData > trvPtr.data
            trvPtr = trvPtr.rightChild
         end #if
      end #while

      if trvPtr == nil
         @result = inData + " not found."
      else
         @result = inData + " found!"
      end #if

   end # def search

   def remove(data)
   end # def remove data

   def status
      return @result
   end

end #BinaryTree

$binaryTree = BinaryTree.new
