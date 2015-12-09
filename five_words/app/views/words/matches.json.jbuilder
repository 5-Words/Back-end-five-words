json.array! @matches do |word|
json.extract! word, :word,  :category, :id, :user_id, :username
end