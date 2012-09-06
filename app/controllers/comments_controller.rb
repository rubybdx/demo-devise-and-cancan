class CommentsController < ApplicationController
  load_and_authorize_resource :comment
end
