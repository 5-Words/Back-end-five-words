json.extract! @user, :name, :email, :bio, :birthday, :phone_number, :location, :gender
json.image_url image.image.url(:medium)