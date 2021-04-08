class Author::ArticlesController < ApplicationController
before_action :set_article, only: [:show, :edit, :update, :destroy]
before_action :check_if_author
# before_action :correct_user

def index
@articles = Article.all.order('created_at DESC')
end

def new
@article = Article.new
end

def edit
@article = Article.find(params[:id])
	end

def show
@article = Article.find params[:id]
session[:current_article] = @article.id
end

def create
@article = current_user.articles.build(article_params)
 if @article.save
 	redirect_to @article
      flash[:notice] = 'The article was created succesfully.'
      
    else
      

      render 'new'
    end
end

def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'

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

# def correct_user
#    @article = current_user.articles.find_by(id: params[:id])
#     redirect_to articles_path, notice: 'Not Authorized' if @article.nil?
#   end

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