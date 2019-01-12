class PostsController < ApplicationController
	before_action :set_post, only: [ :show, :edit, :update, :destroy]
	def index #показать все посты
		@posts = Post.all
	end
	#показать один пост
	def show
	end
	#создание нового вопроса
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else 
			render :new
		end
	end
	def edit
	end
	def update
		if @post.update_attributes(post_params)
			redirect_to @post
		else 
			render :edit
		end
	end
	def destroy
		@post.destroy
		redirect_to posts_path
	end
	private 
	def set_post
		@post = Post.find(params[:id])
	end
	def post_params
		#фильтруем параметры т.е. разрешаем только эти 3 поля
		params.require(:post).permit(:title, :summary, :body)
	end
end