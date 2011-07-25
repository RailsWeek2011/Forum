module ApplicationHelper
  def local_button
    if I18n.locale == "de"
      "en"
    else
      "de"
    end
  end
end
