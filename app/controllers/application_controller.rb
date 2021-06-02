class ApplicationController < ActionController::Base
before_action :set_search

  def set_search
      @search = Post.ransack(params[:q])
      @search_posts = @search.result(distinct: true)
      @search_count = @search_posts.count
  end
end
