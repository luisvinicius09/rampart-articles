class FiltersController < ApplicationController
  def business
    @bus_articles = Article.all.business
  end

  def sports
    @spo_articles = Article.all.sports
  end 

  def fashion
    @fas_articles = Article.all.fashion
  end

  def entertainment
    @ent_articles = Article.all.entertainment
  end
end