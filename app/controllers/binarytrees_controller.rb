require_relative  'binaryTreeClass' # this was needed b/c global $binaryTree was null
class BinarytreesController < ApplicationController
   def create
      t1 = Time.now.to_f
      if params[:commit] == 'Insert'
         #TODO: allow title param to be "00000n" where n is any # of random items to insert
         #if params[:binarytree][:title][0..4] == "00000"
         #inString = params[:binarytree][:title]
         #num = inString[5..inString.size-1].to_i
         #$binaryTree.insertMultipleRandom(num)
         $binaryTree.insert(params[:binarytree][:title].to_i) # to_i converts string to int
      elsif params[:commit] == 'Search'
         $binaryTree.search($binaryTree.head,nil,params[:binarytree][:title].to_i)
      elsif params[:commit] == 'Remove'
         # TODO: implement remove all
         # if params[:binarytree][:title] == "00000" # zeros b/c text cant be input
         #$binaryTree.removeAll()
         #else
         $binaryTree.remove($binaryTree.head,nil,params[:binarytree][:title].to_i)
         #end #if
      end
      t2 = Time.now.to_f
      time_ms = (t2-t1) * 1000
      $binaryTree.result = $binaryTree.result + " - " + (time_ms.round(2)).to_s + "ms"
      redirect_to home_index_url
   end

end
