class PostsController < ApplicationController
    before_action :authenticate_account!, except: [ :index, :show ]
    before_action :set_post, only: [:show]
    before_action :auth_member, only: [:new]

    def index
      @posts = Post.all

    end

    def show
      @comment = Comment.new
    end

    def new
      @community = Community.find(params[:community_id])
      @post = Post.new
    end

    def create
      @post = Post.new post_values
      @post.account_id = current_account.id
      @post.community_id = params[:community_id]
      if @post.save
         redirect_to communities_path(@post.community_id)
      else
        #Get the community saved with post
        @community = Community.find(params[:community_id])
        render :new
      end
    end

    private
    # Finding communities
    def set_post
      @post = Post.includes(:comments).find(params[:id])
    end

    # Setting auth for member, preventing users from posting
    # without joing the community
    def auth_member
      unless Subscription.where(community_id: params[community_id], account_id: current_account.id).any?
         redirect_to root_path, flash: { danger: "You are not authorized to view this page"}
      end
    end

    def post_values
       params.require(:post).permit(:title, :body)
    end
end
