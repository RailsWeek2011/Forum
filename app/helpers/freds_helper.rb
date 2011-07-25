module FredsHelper 
  def red_cloth text
     RedCloth.new(text).to_html
   end  
end
