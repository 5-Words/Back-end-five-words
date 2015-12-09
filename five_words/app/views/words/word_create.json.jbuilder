json.array! @words do |word|
json.extract! word, :word,  :category, :id, :user_id, :username
end
