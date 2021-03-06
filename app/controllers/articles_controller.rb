class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /articles or /articles.json
  def index
    @recent_bus_article = Article.all.business.first
    @recent_sports_article = Article.all.sports.first
    @recent_fashion_article = Article.all.fashion.first
    @recent_ent_article = Article.all.entertainment.first
    @most_popular_article = Vote.popular_article
  end

  def all
    @articles = Article.all.ordered_by_most_recent
  end

  # GET /articles/1 or /articles/1.json
  def show
    # This method provides the ability to display the articles in a single page
  end

  # GET /articles/new
  def new
    @article = current_user.articles.build
  end

  # GET /articles/1/edit
  def edit
    # This method provides the ability to edit articles created by the user
  end

  # POST /articles or /articles.json
  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        Connection.new(article_id: @article.id, category_id: article_params[:category_id]).save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :content, :image_url, :category_id)
  end
end
