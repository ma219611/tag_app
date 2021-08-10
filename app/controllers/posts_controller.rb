class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  # before_action :set_post_form, only: [:edit]

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
    post_attributes = @post.attributes
    post_attributes[:image] = @post.image
    @post_form = PostForm.new(post_attributes)
    @post_form.tag_name = @post.tags&.first&.tag_name
  end

  # ToDo：関数として切り出すかどうか
  def update
    params  = post_form_params
    params = params.merge(image: @post.image.blob) unless params[:image]
    # 変更点：paramsを代入
    # 変更点：画象がない時は画像を代入
    @post_form = PostForm.new(params)

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

  # def set_post_form

  # end
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