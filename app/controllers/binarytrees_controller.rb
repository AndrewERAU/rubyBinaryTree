require_relative  'binaryTreeClass' # this was needed b/c global $binaryTree was null
class BinarytreesController < ApplicationController
   # TODO: Add timing info and print out time taken for each operation in view
   def create
      t1 = Time.now.to_f
      if params[:commit] == 'Insert'
         $binaryTree.insert(params[:binarytree][:title].to_i) # to_i converts string to int
      elsif params[:commit] == 'Search'
         $binaryTree.search($binaryTree.head,nil,params[:binarytree][:title].to_i)
      elsif params[:commit] == 'Remove'
         $binaryTree.remove($binaryTree.head,nil,params[:binarytree][:title].to_i)
      end
      t2 = Time.now.to_f
      time_ms = (t2-t1) * 1000
      $binaryTree.result = $binaryTree.result + " - " + (time_ms.round(2)).to_s + "ms"
      redirect_to home_index_url
   end

end
