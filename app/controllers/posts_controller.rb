class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  load_and_authorize_resource
  check_authorization


  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @headline = t(:new_post)
    
    initialize_post

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @headline = t(:edit_post)
  end

  # POST /posts
  # POST /posts.json
  def create
    
    @post = Post.new(params[:post])
    @post.user = current_user
    @fred = Fred.find(@post[:fred_id])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @fred, notice: t(:created_post_success) }
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
    @post = Post.find(params[:id])
    
    @fred = Fred.find(@post[:fred_id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @fred, notice: t(:updated_post_success) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    fredid = @post.fred_id
    @post.delete_context        #the new methods, more elegant to me

    respond_to do |format|
      format.html { redirect_to fred_path(fredid), :method => :get, :notice  => t(:deleted_post_success) }
      format.json { head :ok }
    end
  end
  
  def initialize_post
    if params[:post_or_thread] == "thread"
      thread_id = params[:id]
    else
      @post[:post_id] = params[:id]
      @parent = Post.find(params[:id])
      until @parent[:post_id].nil?
        @parent = @parent.post
      end
      thread_id = @parent[:fred_id]
    end
    
    @post[:fred_id] = thread_id
  end

end
