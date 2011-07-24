module ProfilesHelper
  def proflieExists?
    if @Profiles.find current_user.id != nil
      return true
    else
      return false
    end
  end
end
