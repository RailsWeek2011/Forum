module CategoriesHelper
  def upper_category
    category = Category.find(params[:id])
    if category[:category_id].nil?
      categories_path
    else
      category_path(category[:category_id])
    end
  end
end
