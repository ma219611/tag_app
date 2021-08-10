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

  def update
    post_form_params = params.require(:post_form).permit(:text, :tag_name, :image)
    # ↑これ無くしたい
    binding.pry
    # ↓画像だけ付け加えたい
    unless post_form_params[:image]
      post_form_params = post_form_params.merge(image: @post_attributes[:image].blob)
      # blobつけないとエラーになるため
    end
    @post_form = PostForm.new(post_form_params)
    
    if @post_form.valid?
      @post_form.update(post_form_params, @post)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def post_form_params
    post_form_params = params.require(:post_form).permit(:text, :tag_name, :image)
    return post_form_params
  end

  # def update_post_form_params
  #   post_form_params = params.require(:post_form).permit(:text, :tag_name, :image)
  #   # ストロングパラメーターのpost_form_paramsは呼び出せるものの、マージしたり諸々しようとするとエラーになったのでもう一度定義

  #   # もしimageが空の場合はimageを代入する
  #   unless post_form_params[:image]
  #     post_form_params = post_form_params.merge(image: @post_attributes[:image].blob)
  #     # blobつけないとエラーになるため
  #   end
  #   return post_form_params
  #   # リターンしないとエラーになるため
  # end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_post_form
    @post_attributes = @post.attributes
    @post_attributes[:image] = @post.image
    @post_form = PostForm.new(@post_attributes)
    # @をつける
  end
end
