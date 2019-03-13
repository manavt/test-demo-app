rails new app_name
cd app_name
rails s/server
rails g/generate controller users index show new edit
rails g model user name email password password_confirm mobile_no

index   # to display all the data

new # onboard a new entity/user

create will take all the data from the new page
and push into db

edit  # to modify the existing data

update will take all the data from the edit page
and push into db

show  # to display individual data

delete

localhost:3000/users

http://localhost:4000/
|
Submitted to Puma
  |
Dispatcher
  |
  look  into routes "/users" =>
  |
  Controller | users

  |



User
  name
  email
  password
  password_confirm
  mobile_no    
