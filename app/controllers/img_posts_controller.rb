class ImgPostsController < ApplicationController
  def show
    @posts = ImgPost.all
  end

  def create
    @post = ImgPost.new(permit_params)
    @post.save!
    redirect_to action: 'show'
  end

  private
    def permit_params
      params.require(:img_post).permit(:user_id, :image)
    end
end
