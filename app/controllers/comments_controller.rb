class CommentsController < ApplicationController

  # GET /comments
  # GET /comments.json
  before_filter :load_commentable

  def index
    @post = Post.find(params[:post_id])
    @project = Project.find(params[:project_id])
    @comments = @commentable.comments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @post = Post.find(params[:post_id])
    @project = Project.find(params[:project_id])
    @comment = @commentable.comments.find(params[:id])
    #authorize @comment

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end


  def new
    @post = Post.find(params[:post_id])
    @comment = @commentable.comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @post = Post.find(params[:post_id])
    @comment = @commentable.comments.find(params[:id])
    authorize @comment
  end

  # POST /comments
  # POST /comments.json
  def create
    #@post = Post.find(params[:post_id])
    @comment = @commentable.comments.new(comment_params)

      if @comment.save
        flash[:notice] = "Comment is awaiting moderation"
        redirect_to @commentable, notice: "Comment is awaiting moderation."
      else
        instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
        render template: "#{@resource}/show"
      end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    authorize @comment

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to [@post, @comment], notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'You are not allowed to edit this comment.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    authorize @comment

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

private

  def comment_params
    params.require(:comment).permit(:author,
                                    :author_url,
                                    :author_email,
                                    :content,
                                    :referrer,
                                    :commentable_id)
  end

  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end
end
