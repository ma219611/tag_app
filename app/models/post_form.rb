class PostForm
  include ActiveModel::Model

  ## PostFormクラスのオブジェクトがPostモデルの属性を扱えるようにする
  attr_accessor(
    :text, :image,
    :id, :created_at, :datetime, :updated_at, :datetime
   )

  with_options presence: true do
    validates :text
    validates :image
  end

  def save
    Post.create(text: text, image: image)
  end

  def update(params, post)
    # post_form_paramsをparamsとして受け取る
    # @postをpostとして受け取る
    post.update(params)
  end
end