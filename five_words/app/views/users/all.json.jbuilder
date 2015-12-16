json.array! @users do |user|
json.extract! user, :username, :access_token
end