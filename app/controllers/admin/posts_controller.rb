class Admin::PostsController < Admin::BaseController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params_post)
    if @post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post = @post.update(params_post)
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def params_post
    params.require(:post).permit(:name_1, :name_2, :visi, :misi)
  end
end