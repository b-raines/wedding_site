class StaticPagesController < ApplicationController

  before_action :show_signin_page_if_not_signed_in

  def home

  end

  def wedding

  end

  def party

  end

  def guestbook
    @microposts = Micropost.all.paginate(page: params[:page])
    @micropost = current_user.microposts.build if signed_in?
  end

  # before filters

  def show_signin_page_if_not_signed_in
    unless signed_in?
      redirect_to signin_path
    end
  end

end
