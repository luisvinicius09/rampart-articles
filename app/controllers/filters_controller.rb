class FiltersController < ApplicationController
  def filtered
    @bus_articles = Article.where(category_id: 1)
  end
end