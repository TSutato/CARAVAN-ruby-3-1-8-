class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end
  
  def index
    @blogs = Blog.all
    p "標準出力にのみ反映"
    logger.debug("標準出力とログファイルに記録される")
  end
  
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @blog = Blog.new
  end
  
  def create
   @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog.id)
    else
      render :new
    end
  end
  
  
  
  def destroy
    blog =Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

  def edit
   @blog = Blog.find(params[:id])
    
  end
  
  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title,:category,:body)
  end
  
end
