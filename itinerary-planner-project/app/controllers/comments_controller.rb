class CommentsController < ApplicationController
  def index
  end

def create
  unless find_commentable.comments.build(comment_params).save
    flash[:notice] = 'something went wrong! validation failed'
  end
  redirect_to :back
end

private
    def comment_params
      params.require(:comment).permit(:content)
    end

  def find_commentable
  params.each do |name, value|
    if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
    end
  end
  nil
  end
end


