class HomeController < ApplicationController
  def index
    @photos = Post.all
  end
end
