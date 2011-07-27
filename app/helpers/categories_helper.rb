module CategoriesHelper
  def upper_category
    category = Category.find(params[:id])
    if category[:category_id].nil?
      categories_path
    else
      category_path(category[:category_id])
    end
  end
  
  def last_post fred
    unless (Post.where(:fred_id => fred[:id])).empty?
      last_post = Post.where(:created_at => Post.maximum("created_at"))
      return last_post[0]
    end
    
    return fred
  end
  
  def count_categories category
    categories_count = Category.where(:category_id => category[:id]).count
  end
  
  def count_threads category
    thread_count = Fred.where(:category_id => category[:id]).count
  end

end


