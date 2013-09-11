class StaticPagesController < ApplicationController

  before_action :show_signin_page_if_not_user

  def home

  end

  def wedding

  end

  def party

  end

  def guestbook

  end

  # before filters

  def show_signin_page_if_not_user
    unless signed_in?
      redirect_to signin_path
    end
  end

end
