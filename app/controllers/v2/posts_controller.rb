module V2
  class PostsController < BaseController

    def index
      @posts = Post.all
    end

  end
end
