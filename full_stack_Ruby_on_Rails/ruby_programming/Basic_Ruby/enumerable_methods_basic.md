# Basic Enumerable Methods

### quick notes
Remember --- DRY - Don't Repeat Yourself
If an object as a *#* before it is is a method

Notes from https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/basic-enumerable-methods

### Basics
Enumerables are built in methods in Ruby that are included for both arrays and hashes

They are looping methods!

Old Methods 
``` Ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

for friend in friends do # We don't need the 'do'
  if friend != 'Brian'
  invited_list.push(friend)
  end
end

invited_list #=> ["Sharon", "Leo", "Leila", "Arun"]
```

The same thing but a lot cleaner:
```Ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }
#=> ["Sharon", "Leo", "Leila", "Arun"]
```
and even cleaner than that:
``` Ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.reject { |friend| friend == 'Brian' }
#=> ["Sharon", "Leo", "Leila", "Arun"]
```

### Basic Enumerables
1. #each
2. #each_with_index
3. #select
4. #reject 
5. #reduce

### #each
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.each { |friend| puts "Hello, " + friend }

#=> Hello, Sharon
#=> Hello, Leo
#=> Hello, Leila
#=> Hello, Brian
#=> Hello, Arun

#=> ["Sharon", "Leo", "Leila", "Brian" "Arun"]
```

Lets break it down: <br>
* **friends** is an array of strings that we are going to iterate through
* **friend** inside of the | | is a block variable. This is item in the array that is currently selected
* **#each** is the enumerable method
* **{ |friend| puts "Hello, " + friend }** is the block. Code that is run everytime for each item in the array

### #each_with_index

The same as each but with an index! to use the index add another block variable!
```ruby
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even? }

#=> apple
#=> strawberry
#=> ["apple", "banana", "strawberry", "pineapple"]
```

### Map method
* transforms each element in the array and returns the transformed elements in a new array
* also known as *#collect* 

So instead of this ugly thing: 
```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
shouting_at_friends = []

friends.each { |friend| shouting_at_friends.push(friend.upcase) }
#=> ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

shouting_at_friends #=> ['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']
```
You get the much cleaner:
```Ruby 
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.map { |friend| friend.upcase }
#=> `['SHARON', 'LEO', 'LEILA', 'BRIAN', 'ARUN']`
```

### Select 
* does a test on every item and only returns those that the test results in true
* also known as *#filter*

```ruby
friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']

friends.select { |friend| friend != 'Brian' }

#=> ["Sharon", "Leo", "Leila", "Arun"]
```

If we were using it with a hash instead of an array
Note the hash is key => value; person => response to party invite
```ruby
 responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
responses.select { |person, response| response == 'yes'}
#=> {"Sharon"=>"yes", "Arun"=>"yes"}
```
