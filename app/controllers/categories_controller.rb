class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  load_and_authorize_resource
  check_authorization


  def index
    @categories = Category.where(:category_id => nil)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    #show all kind categories
    @categories = Category.where(:category_id => params[:id])
    @freds = Fred.where(:category_id => params[:id]).order("updated_at DESC")

      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @form_headline = t(:category_headline)
    @category = Category.new
    unless params[:id] == "0"
      @parent = Category.find(params[:id])
      @category.category = @parent 
    end
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @form_headline = "Edit Category"
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category]) 

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: params}
        format.json { render json: @category, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @form_headline = "Update Category"
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :ok }
    end
  end
end
