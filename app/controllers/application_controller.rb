class ApplicationController < ActionController::Base
before_action :set_search

  def set_search
      @search = Post.ransack(params[:q])
      @search_posts = @search.result(distinct: true).page(params[:page]).per(12)
      @search_count = @search.result.count
  end
end
