class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  layout 'blog'

  rescue_from Pundit::NotAuthorizedError, :with => :record_not_found
  before_filter :authenticate_user!, except: [:index, :show]
  def frontblog
    @posts = Post.all
    @lastpost = Post.last
  end

  def index
    @posts = Post.all
    @lastpost = Post.last
    @post = Post.last(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @posts = Post.all
    @lastpost = Post.last
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @lastpost = Post.last
    @posts = Post.all
    @projects = Project.all
    @post = Post.new
    #current_user.posts << @post

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @posts = Post.all
    @lastpost = Post.last
    @post = Post.find(params[:id])
    # authorize @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @posts = Post.all
    @lastpost = Post.last
    @projects = Project.all
    @post = Post.new(params[:post])
    #authorize @post
    current_user.posts << @post


    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @posts = Post.all
    @post = Post.find(params[:id])
    #authorize @post

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @posts = Post.all
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path, notice: "Post was deleted." }
      format.json { head :no_content }
    end
  end

  private
  def record_not_found
    redirect_to root_path, :alert => "Couldn't create post."
  end
end
