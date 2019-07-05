class ArticlesController < ApplicationController

    before_action :set_article, only: [:edit, :update, :show, :destroy]
    helper_method :current_user, :logged_in?

    def new
        @article = current_user.articles.build
    end

    def show
        set_article
        @comment = Comment.new(article_id: params[:id])
        user = session[:user_id]
        @comments = @article.comments
    end

    def geologyarticles
        @articles = Article.paginate(page: params[:page])
    end

    def musicarticles
        @articles = Article.all
    end

    def create
        @article = current_user.articles.new(article_params)
        if @article.save
            flash[:notice] = "Article created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def update
        set_article
        if @article.update(article_params)
            flash[:notice] = "Article updated"
            redirect_to article_path(@article)
        else
            flash[:notice]
            render 'edit'
        end
    end

    def edit
        set_article
    end

    def destroy
        set_article
        @article = current_user.articles.find(params[:id])
        if @article.destroy
            flash[:notice] = "Article was deleted"
            redirect_to articles_path
        else
            redirect_to articles_path
        end
    end

    private

        def set_article
            @article = Article.find(params[:id])
        end

        def article_params
            params.require(:article).permit(:title, :content, :image, :geology_article, :music_article)
        end

        def comment_params
            params.require(:comment).permit(:content, :user_id, :article_id)
        end

end
