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
			redirect_to @post, success: 'Вопрос был успешно создан'
		else 
			render :new, danger: 'Вопрос не был создан'
		end
	end
	def edit
	end
	def update
		if @post.update_attributes(post_params)
			redirect_to @post, success: 'Вопрос был успешно обновлен'
		else 
			render :edit, danger: 'Вопрос не был обновлен'
		end
	end
	def destroy
		@post.destroy
		redirect_to posts_path, success: 'Вопрос был успешно удален'
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