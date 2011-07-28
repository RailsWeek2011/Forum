module PostsHelper
  def get_quote
    
      if params[:reply_or_quote] == "reply"
        return ""
      end
      
      if params[:post_or_thread] == "thread"
        content = Fred.find(params[:id]).content
      else
        content = Post.find(params[:id]).content
        # check if user just wants to edit his post
        if params[:post_or_thread].nil?
          return content
        end
      end
      
      pattern = /^bq\.\./
      
      if (content =~ pattern).nil?
        content = "bq.. " + content
        pattern = /^p\./
        result = content =~ pattern
        unless result.nil?
          content[result..(result+1)] = "bg.."
        end
      end
      content = content + "\n\np. "
      return content
  end
  
  def gravatar_for user
    gravatar_image_tag(user.email.downcase, :alt => user.nick,
                                            :class => 'gravatar',
                                            :gravatar => {:size => 40})
  end
  
  def show_edit post
    if current_user == post.user &&  ((Time.now - post[:created_at]) < 1200 )
      if post.class == Post
        link_to t(:edit), edit_post_path(post)
      else
        link_to t(:edit), edit_fred_path(post)
      end
    end
  end
  
  def link_to_user user
    if can? :show, @users
      if current_user && user.alive
        if current_user == user
          return link_to user.nick, edit_user_registration_path, :class => "post_author"
        end
          return link_to user.nick, show_user_path(user), :class => "post_author"
      end
      
    end
      return user.nick
  end
  
end
