class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :admin_user_or_correct_user, only: :destroy
  

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @microposts = Micropost.all.paginate(page: params[:page])
    if @micropost.save
      flash[:success] = "Post created!"
      redirect_to guestbook_path
    else
      render 'static_pages/guestbook'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to guestbook_path
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def admin_user_or_correct_user
      if current_user.admin?
        @micropost = Micropost.find_by(id: params[:id])
      else
        @micropost = current_user.microposts.find_by(id: params[:id])
      end
      redirect_to guestbook_path if @micropost.nil?
    end

end
