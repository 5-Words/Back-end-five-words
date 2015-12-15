
json.array! @image do |image|
json.extract! image, :id, :user_id
json.image_url image.image.url

end