class Author::ArticlesController < ApplicationController
before_action :set_article, only: [:show, :edit, :update, :destroy]
before_action :check_if_author

def index
@articles = Article.all.order('created_at DESC')
end

def new
@article = Article.new
end

def edit

	end

def show
@article = Article.find params[:id]
session[:current_article] = @article.id
end

def create
@article = current_userarticles.build(article_params)
 if @article.save
      flash[:notice] = 'The article was created succesfully.'
      redirect_to @article
    else
      

      render 'new'
    end
end

def update
respond_to do |format|
if @article.update(article_params)
	format.html { redirect_to @article, notice: 'Article is successfully updated.' }
	format.json { render :show, status: :ok, location: @article }
else 
	format.html { render :edit }
	format.json { render json: @article.errors, status: :unprocessable_entity }
end
end
end

def destroy
@article.destroy
respond_to do |format|
format.html { redirect_to articles_url, notice: 'Article was successfully destroyed' }
format.json { head :no_content }
	end
end


private

def check_if_author
redirect_to root_path unless current_user.is_author?
end

def set_article
@article = Article.find(params[:id])
end

def article_params
params.require(:article).permit(:title, :body, :author_id)
end

end