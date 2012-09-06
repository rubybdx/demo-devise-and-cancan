class CommentsController < ApplicationController
  load_and_authorize_resource :comment

  def create
    @comment.save
  end
end
