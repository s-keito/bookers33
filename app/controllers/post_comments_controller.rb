class PostCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
  end

  def destroy
    PostComment.find(params[:id]).destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end