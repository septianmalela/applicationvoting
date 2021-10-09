class User::HomesController < User::BaseController
  def index
    @posts = Post.all    
  end
end