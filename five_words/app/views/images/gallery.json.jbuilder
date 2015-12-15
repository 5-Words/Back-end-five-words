json.array! @images do |image|
json.extract! image, :image_file_name, :image_updated_at, :id, :user_id
json.image_url image.image.url
end