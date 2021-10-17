class Admin::HomesController < Admin::BaseController
  def index
    @posts = Post.all
  end
end