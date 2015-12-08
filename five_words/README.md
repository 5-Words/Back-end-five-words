== README

##5-Words

This is an API for my teams application called 5-Words. This database stores a users interests and matches them to other users with the same interests.

##For creating or editing word the `access_token` that is generated on login or signup must passed in the header

##Table of Contents

1. [Create User](#create_user)
2. [Sign In](#sign_in)
3. [Add words to Categories](#create_words)
4. [Matching Words](#search)
5. [Editing Words](#editing)

##Create User <a id="create_user"></a>

###POST /signup

**Params**

* `name:` This is a `:string`
* `email:` A string. Must be a valid email
* `username:` A `:string` this must be unique
* `password:`

This will return this json response
```
{
  "access_token": "bb6a7f8728ccd04b424e964fb16962a3",
  "username": "Charlie4",
  "name": "Charlie",
  "email": "kittens@mittens.com",
  "id": 6
}
```

##Sign In <a id="sign_in"></a>

###POST /login

**Params**

* `username:`
* `password:`

This will return this json response
```
{
  "access_token": "bb6a7f8728ccd04b424e964fb16962a3",
  "username": "Charlie4",
  "name": "Charlie"
}
```

###Add Words to Categories <a id="create_words"></a>

This is where the user lists thier 5 words of interest for a category

**Params**

The required params are two keys. `word:`, and `category:`. `word:` points to an array of words you want to create and `category:` is the category it is going into. Please note a word can only be entered into an [allowed category](#allowed_categories).

```
   {
    word: => [dog, cat, chicken, snake, bird], 
    category: => "animals"
   }
```

This will return this json which is all the current words in a category across all users
```
 {
    "word": "something",
    "category": "ultra",
    "id": 124,
    "user_id": 4
  },
  {
    "word": "this is it",
    "category": "ultra",
    "id": 125,
    "user_id": 4
  },
  {
    "word": "howdy",
    "category": "ultra",
    "id": 126,
    "user_id": 5
  },
  {
    "word": "doody",
    "category": "ultra",
    "id": 127,
    "user_id": 5
  },
```

##Editing Words <a id="editing"></a>

###PUT word/edit

**Params**

An array of hashes containing the word id `id:` and what you want to change that word to `new:`

```
   {
    words => [
              {id: => 1, new: => "koala"},
              {id: => 2, new: => "tiger"},
              {id: => 3, new: => "kangaroo"},
              {id: => 4, new: => "dragon"},
              {id: => 5, new: => "python"}
              ]
	  }
```

##Searching Users <a id="search"></a>

###GET "/words/matches/:category"

####Access token must be passed in the header

**Params**

* `category:` This is the category you are finding matches for.

This will return json of words that match any words in the specified catagory with the `user_id:` associated with that word

###GET "/words/:user_id/:category"

####This will return a json object of all the words a user has in the selected category

**Params**

* `user_id:`
* `category:`

###GET "/category/:category/"

**Params**

* `category:`

####This will return all words in the database for the selected category

**Params**

* `word:`
* `category:`

###GET "/match/:word/:category/"

####This will return user information by matching words that are in the specified word and category

###Allowed Categories<a id="allowed_categories"></a>

travel, golden, tech, sports, foodie, cars, books, music, film, pets












