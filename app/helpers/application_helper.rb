module ApplicationHelper
  def local_button
    if I18n.locale == :de
      return :en
    else
      return :de
    end
  end
end
