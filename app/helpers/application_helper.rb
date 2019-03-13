module ApplicationHelper
  def hello(return_user_id)
    user = (User.find_by_id return_user_id).email rescue "Undefined"
    "My name is Rails #{user}"
  end

end
