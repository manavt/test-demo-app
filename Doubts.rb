Step 1. Click on logout function.
  <a rel="nofollow" data-method="delete" href="/users/logout">Logout</a>
Step 2. Request goes back to browser to rails app in below format.
    Method request type : delete
    Action :              /logout
    logout_users DELETE /users/logout(.:format)         users#logout

Step 3. Rails app routes verifies that request with the above given method request type
        and action if its a valid request(means already defined in routes) then
        routes locate the controller and give the jobs to it.
Step 4. If you see above then action name is nothing but a method defined inside a
        Controller
Step 4. As the reuest gets submitted to 'logout' function, filter gets activated
        and run the logic of filter method before running 'logout' function.


        Callbacks - they are the hooks in the object life cycle.



users_path  "/users"
users_url "http://localhost:3000/users"

Association

belongs_to
has_one
has_many
has_one :through
has_many :through
has_and_belongs_to_many
polymorphic

STI


class User
  has_one :image
end

class Image
  belongs_to :user
end



Image:
  id, image_name, image_size, user_id


u = User.find(1)
u.image
