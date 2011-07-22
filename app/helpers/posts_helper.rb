module PostsHelper
  def get_quote
    if params[:reply_or_quote] == "quote"
      if params[:post_or_thread] == "thread"
        Fred.find(params[:id]).content
      else
        Post.find(params[:id]).content
      end
    end
  end
  
end
