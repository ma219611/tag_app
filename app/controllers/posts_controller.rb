class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post_form = PostForm.new
  end

  def create
    binding.pry
    @post_form = PostForm.new(post_form_params)
    if @post_form.valid?
      @post_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  # ToDo：関数として切り出すかどうか
  def edit
    # @postの中身をハッシュとして取り出す
    post_attributes = @post.attributes
    # 画像とタグの情報を付け加える merge!とすると追加したもの自体でオブジェクトを更新する
    post_attributes.merge!(image: @post.image, tag_name: @post.tags&.first&.tag_name)
    # @post_formとしてインスタンス生成する
    @post_form = PostForm.new(post_attributes)
  end

  # ToDo：関数として切り出すかどうか
  def update
    post_attributes = @post.attributes
    # 画像とタグの情報を付け加える merge!とすると追加したもの自体でオブジェクトを更新する
    post_attributes.merge!(image: @post.image, tag_name: @post.tags&.first&.tag_name)
    # @post_formとしてインスタンス生成する
    @post_form = PostForm.new(post_attributes)
    # paramsの情報を取得する
    params  = post_form_params
    # paramsの情報に画象を追加する
    params.merge!(image: @post.image.blob) unless params[:image]
    @post_form = PostForm.new(params)

    binding.pry

    # validの前に編集後の内容でインスタンス生成をするため
    if @post_form.valid?
      @post_form.update(params, @post)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def post_form_params
    params.require(:post_form).permit(:text, :tag_name, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end