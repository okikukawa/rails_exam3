class RecordsController < ApplicationController
  before_action :set_record, only:[:show, :edit, :update, :destroy]
  def index
    @record = Record.all
  end
  def new
    if logged_in?
      @record = Record.new
    else
      needed_login
    end
  end
  def create
    # @record = Record.new(record_params)
    # @record.user_id = current_user.id
    @record = current_user.records.build(record_params)
    if params[:back]
      render :new
    else
      if @record.save
        redirect_to records_path, notice: "記事を投稿しました。"
      else
        render :new
      end
    end
  end
  def show
    if logged_in?
      @favorite = current_user.favorites.find_by(record_id: @record.id)
    else
      needed_login
    end
  end
  def edit
  end
  def update
    if @record.update(record_params)
      redirect_to records_path, notice: "記事を編集しました。"
    else
      render :edit
    end
  end
  def destroy
    @record.destroy
    redirect_to records_path, notice: "記事を削除しました。"
  end
  def confirm
    # @record = Record.new(record_params)
    # @record.user_id = current_user.id
    @record = current_user.records.build(record_params)
    render :new if @record.invalid?
  end
  private
  def record_params
    params.require(:record).permit(:content, :image, :image_cache)
  end
  def set_record
    @record = Record.find(params[:id])
  end
  def needed_login
    redirect_to new_user_path, notice: "ログインが必要です"
  end
end
