json.array! @friends do |friend|
json.extract! friend, :username, :email, :id, :user_id
end