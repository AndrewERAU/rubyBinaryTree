class Node
   attr_accessor :data, :leftChild, :rightChild

   def initialize(data)
      @data = data
      @leftChild = nil
      @rightChild = nil
   end

   # def setData
   #    print "Data (enter an integer used as the data of the new node): "
   #    return gets.chomp
   #    # TODO:update, if data is not an integer, say invalid input and ask again for data
   # end

end

class BinaryTree

   attr_accessor :head, :result

   # Constructor called when object is created
   def initialize()
      @head = nil # head is a variable only visible in this class?? update check
      @result = ""
      @preorderTraversalResult = ""
      @inorderTraversalResult = ""
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
      @result = data.to_s + " inserted!"
   end # def insert

   def search(startNode,parentOfStartNode,inData) # set @result
      trvPtr = startNode
      parentPtr = parentOfStartNode # used for node removal (see remove function)

      while (trvPtr != nil) && (inData != trvPtr.data)
         parentPtr = trvPtr
         if inData < trvPtr.data
            trvPtr = trvPtr.leftChild
         elsif inData > trvPtr.data
            trvPtr = trvPtr.rightChild
         end #if
      end #while

      if trvPtr == nil
         @result = inData.to_s + " not found."
         return nil, nil
         # need explicit return b/c of weird return valud of this string
         # undefined method `leftChild' for "4 not found.":String
      else
         @result = inData.to_s + " found!"
         return trvPtr, parentPtr

      end #if

   end # def search

   def remove(startNode,parentOfStartNode,data) #parentOfStartNode = nil if startNode is root
      nodeToRemove, parentOfNodeToRemove = search(startNode, parentOfStartNode,data)
      if nodeToRemove == nil
         @result = data.to_s + " not removed (not found in tree)"
         return nil
      #elsif nodeToRemove == @head

      elsif nodeToRemove.leftChild == nil && nodeToRemove.rightChild == nil
         # both children equal nil. easy. simply remove node
         if nodeToRemove == @head
            @head = nil # tree was just 1 node, now its 0 nodes
         elsif parentOfNodeToRemove.leftChild != nil &&
            parentOfNodeToRemove.leftChild.data == nodeToRemove.data
            # finds child of parent that should be deleted

            parentOfNodeToRemove.leftChild = nil
         else
            parentOfNodeToRemove.rightChild = nil
         end #if
      elsif nodeToRemove.leftChild == nil || nodeToRemove.rightChild == nil
         # one child equals nil. have parent point to child
         if nodeToRemove.leftChild == nil
            if nodeToRemove == @head
               @head = @head.rightChild
            elsif parentOfNodeToRemove.leftChild != nil &&
               parentOfNodeToRemove.leftChild.data == nodeToRemove.data
               # finds child of parent that should be deleted
               parentOfNodeToRemove.leftChild = nodeToRemove.rightChild
            else
               parentOfNodeToRemove.rightChild = nodeToRemove.rightChild
            end #if
         else # right child == nil
            if nodeToRemove == @head
               @head = @head.leftChild
            elsif parentOfNodeToRemove.leftChild != nil &&
               parentOfNodeToRemove.leftChild.data == nodeToRemove.data
               # finds child of parent that should be deleted
               parentOfNodeToRemove.leftChild = nodeToRemove.leftChild
            else
               parentOfNodeToRemove.rightChild = nodeToRemove.leftChild
            end #if
         end #if
      else # node-to-remove has 2 children
         # no special logic required for removing root in this case
         # find smallest value in right subtree
         trvPtr = nodeToRemove.rightChild
         minimumNode = nil
         while trvPtr != nil
            minimumNode = trvPtr
            trvPtr = trvPtr.leftChild
         end #while

         # replace value of node-to-remove with value of minimum
         nodeToRemove.data = minimumNode.data

         # remove minimum node from right subtree since it has been moved
         remove(nodeToRemove.rightChild,nodeToRemove,nodeToRemove.data)

      end #if
      @result = "Removed " + data.to_s + "!"
   end # def remove data

   def status
      return @result
   end

   def visitPreorder(node) # used in traversals
      @preorderTraversalResult = @preorderTraversalResult + " " + node.data.to_s
   end # def visit

   def visitInorder(node) # used in traversals
      @inorderTraversalResult = @inorderTraversalResult + " " + node.data.to_s
   end # def visit

   def preOrderTraversal(node)
      if node == @head # reset result variable to print traversals
         @preorderTraversalResult = ""
      end #if
      if node != nil
         visitPreorder(node)
         preOrderTraversal(node.leftChild)
         preOrderTraversal(node.rightChild)
      end #if
      return @preorderTraversalResult
   end # def preOrderTraversal

   def inOrderTraversal(node)
      if node == @head # reset result variable to print traversals
         @inorderTraversalResult = ""
      end #if
      if node != nil
         inOrderTraversal(node.leftChild)
         visitInorder(node)
         inOrderTraversal(node.rightChild)
      end #if

      return @inorderTraversalResult
   end # def preOrderTraversal



end #BinaryTree

$binaryTree = BinaryTree.new
