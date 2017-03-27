require_relative  'binaryTreeClass' # this was needed b/c global $binaryTree was null
class BinarytreesController < ApplicationController
   def create
      if params[:commit] == 'Insert'
         $binaryTree.insert(params[:title])
      elsif params[:commit] == 'Search'
         render plain: params[:binarytree].inspect
      elsif params[:commit] == 'Remove'
         render plain: params[:binarytree].inspect
      end
   end

end
