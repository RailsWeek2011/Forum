class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  load_and_authorize_resource
  check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end


  def index
    @users = User.where(:alive => true).order("nick ASC")
    @headline = t(:all_users)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    
    if @user.deleted?
      redirect_to root_url, :error => t(:tried_show_deleted_user)
    end
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user[:alive] = true

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => t(:updated_user_success) }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    update = {:nick => 'Deleted User', :email => 'deleted_user@example.com', :alive => false}
    @user.update_attributes(update)

    respond_to do |format|
      format.html {redirect_to categories_path, :method => :get}
      format.json { head :ok }
    end
  end

  def update
    @user = User.find(params[:id])


    #params[:roles]= [params[:roles]]
    #params[:roles] = nil

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => t(:updated_user_success) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  
  
end
