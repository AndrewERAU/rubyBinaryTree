require_relative  'binaryTreeClass' # this was needed b/c global $binaryTree was null
class BinarytreesController < ApplicationController
   def create
      if params[:commit] == 'Insert'
         $binaryTree.insert(params[:binarytree][:title])
      elsif params[:commit] == 'Search'
         $binaryTree.search(params[:binarytree][:title])
      elsif params[:commit] == 'Remove'
         render plain: params[:binarytree].inspect
      end

      redirect_to home_index_url
   end

end
