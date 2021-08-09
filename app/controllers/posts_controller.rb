class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  before_action :set_post_form, only: [:edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new(post_form_params)
    if @post_form.valid?
      @post_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @post_form.tag_name = @post.tags&.first&.tag_name
  end

  # def update
  #   binding.pry
  #   @post_form = PostForm.new(update_post_form_params)

  #   if @post_form.valid?
  #     @post_form.update(update_post_form_params, @post)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  def update

    @update_params = params.require(:post_form).permit(:text, :tag_name, :image)
    if @update_params[:image] == nil
      @update_params = @update_params.merge(image: @post_attributes[:image].blob)
    end

    @post_form = PostForm.new(@update_params)
    if @post_form.valid?
      @post_form.update(@update_params, @post)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def post_form_params
    params.require(:post_form).permit(:text, :tag_name, :image)
    # tagとimageの順番変える
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_post_form
    # @postの情報を取得し、@post_formとしてインスタンス生成し直す
    @post_attributes = @post.attributes
    @post_attributes[:image] = @post.image
    @post_form = PostForm.new(@post_attributes)

    # メモeditの時だけ使えればOK、いやupdateでも画像の時に使う
    # @を追加
  end

  # def update_post_form_params
  #   @post_form = params.require(:post_form).permit(:text, :tag_name, :image)
  #   if @post_form[:image] == nil
  #     @post_form.merge(image: @post_attributes[:image].blob)
  #   end
  # end
      # 位置は一番最後に
    # メソッド自体を追加
    # 案レスがなぜかendと反応する
    # blobを追加
    # tagとimageの順番変える
end
