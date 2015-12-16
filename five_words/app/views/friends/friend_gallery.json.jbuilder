json.array! @images do |image|
json.extract! image, :id
json.image_url image.image.url
end