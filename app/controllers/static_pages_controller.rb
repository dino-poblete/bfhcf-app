class StaticPagesController < ApplicationController

  def home
    @post = Post.new
    @devotional = Devotional.new
  end

  def about
  end
end
