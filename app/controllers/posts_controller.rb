class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      # 保存に成功した場合はindexに戻る
      redirect_to posts_path
    else
      # 保存に失敗した場合はnewに戻る
      render :new
    end
  end  
  def edit
    # editのviewで使うために箱を作る
  end
  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      # 保存に失敗した場合はnewに戻る
      render :edit
    end

  end
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  private
  # これ以降のメソッドはcontroller内(クラス内)でしか呼び出せない
  def post_params
    # params.require(:post).permit(:title, :body)postスキーマーのtitleとbodyを許可する。ストロングパラメーター。
    params.require(:post).permit(:title, :body)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end