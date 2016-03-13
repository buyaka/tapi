module V1
  class PostsController < BaseController
    #skip_before_filter :authenticate_user_from_token!, only: [:index, :show]
    before_action :set_post, only: [:show, :update, :destroy]

    def index
      paginated_content = Post.paginate params
      @posts = paginated_content.result
      @meta = paginated_content.meta
    end

    def show
    end

    def create
      @post = Post.new(post_params)
      @post.save
    end

    def update
      @post = Post.find(params[:id])
      @post.assign_attributes(post_params)
      @post.save
    end

    def destroy
      @post.destroy
    end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end

  end
end
