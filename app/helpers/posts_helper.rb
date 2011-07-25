module PostsHelper
  def get_quote
      if params[:reply_or_quote] == "reply"
        return ""
      end
      
      if params[:post_or_thread] == "thread"
        content = Fred.find(params[:id]).content
      else
        content = Post.find(params[:id]).content
      end
      
      pattern = /^bq\.\./
      
      if (content =~ pattern).nil?
        content = "bq.. " + content
        pattern = /^p\./
        result = content =~ pattern
        unless result.nil?
          content[result..(result+1)] = "bg.."
        end
        content = content + "p. "
      end
      return content
  end
  
  def gravatar_for user
    gravatar_image_tag(user.email.downcase, :alt => user.nick,
                                            :class => 'gravatar',
                                            :gravatar => {:size => 40})
  end
  
end
