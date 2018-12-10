class ImgPostsController < ApplicationController
  def show
    @posts = ImgPost.all
  end

  def create
    @post = ImgPost.new(permit_params)
    @post.save!
    redirect_to channel_path(params['img_post']['channel_id'])
  end

  private
    def permit_params
      params.require(:img_post).permit(:channel_id, :user_id, :image)
    end
end
