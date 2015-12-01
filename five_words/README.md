== README

##5-Words

This is an API for my teams application called 5-Words. This database stores a users interests and matches them to other users with the same interests.

##Table of Contents

1. [Create User](#create_user)
2. [Sign In](#sign_in)
3. [Add words to Categories](#create_words)
4. [Matching Words](#search)

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

##Sign In < id="sign_in"></a>

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

* `one:`
* `two:`
* `three:`
* `four:`
* `five:`
* `category:`

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

##Searching Users <a id="search"></a>

There are three different routes for searching users

###GET "/words/:user_id/:category"

####This will

**Params**










