class FredsController < ApplicationController
  # GET /freds
  # GET /freds.json

  load_and_authorize_resource
  check_authorization

  # GET /freds/1
  # GET /freds/1.json
  def show
    @fred = Fred.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fred }
    end
  end

  # GET /freds/new
  # GET /freds/new.json
  def new
    @headline = t(:new_thread)
    @fred = Fred.new
    @parent = Category.find(params[:id])
    @fred.category = @parent

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fred }
    end
  end

  # GET /freds/1/edit
  def edit
    @fred = Fred.find(params[:id])
    @headline = t(:edit_thread)
  end

  # POST /freds
  # POST /freds.json
  def create
    @fred = Fred.new(params[:fred])
    @fred.user =  current_user

    respond_to do |format|
      if @fred.save
        format.html { redirect_to @fred, notice: t(:thread_created) }
        format.json { render json: @fred, status: :created, location: @fred }
      else
        format.html { render action: "new" }
        format.json { render json: @fred.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /freds/1
  # PUT /freds/1.json
  def update
    @fred = Fred.find(params[:id])

    respond_to do |format|
      if @fred.update_attributes(params[:fred])
        format.html { redirect_to @fred, notice: 'Fred was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @fred.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /freds/1
  # DELETE /freds/1.json
  def destroy
    @fred = Fred.find(params[:id])
    categoryid = @fred.category_id
    @fred.delete_context  #the new method

    respond_to do |format|
      format.html { redirect_to category_path(categoryid), :method => :get, :notice => t(:deleted_thread_success) }
      format.json { head :ok }
    end
  end
end
