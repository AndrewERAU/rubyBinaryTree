require_relative  'binaryTreeClass' # this was needed b/c global $binaryTree was null
class BinarytreesController < ApplicationController
   def create
      if params[:commit] == 'Insert'
         $binaryTree.insert(params[:binarytree][:title].to_i) # to_i converts string to int
      elsif params[:commit] == 'Search'
         $binaryTree.search(params[:binarytree][:title].to_i)
      elsif params[:commit] == 'Remove'
         $binaryTree.remove($binaryTree.head,nil,params[:binarytree][:title].to_i)
      end

      redirect_to home_index_url
   end

end
