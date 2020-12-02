class CommentsController < ApplicationController
  def create
    @record = Record.find(params[:record_id])
    @comment = @record.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to record_path(@record) }
      else
        format.html { redirect_to record_path(@record),notice: '投稿に失敗しました。' }
      end
    end
  end
  ptivate
  def comment_params
    params.require(:comment).permit(:record_id, :content)
  end
end
