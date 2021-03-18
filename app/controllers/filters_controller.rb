class FiltersController < ApplicationController
  def business
    @bus_articles = Article.where(category_id: 1)
  end

  def sports
    @spo_articles = Article.where(category_id: 2)
  end

  def fashion
    @fas_articles = Article.where(category_id: 3)
  end

  def entertainment
    @ent_articles = Article.where(category_id: 4)
  end
end