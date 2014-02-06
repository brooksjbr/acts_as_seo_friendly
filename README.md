## ActsAsSeoFriendly

This is a fork of revolutionhealth-acts_as_seo_friendly gem. This fork maintains all original functionality and is an upgrade for compatibility with rails 4.0 and Ruby 2.0.

### Description:

ActsAsSEOFriendly will convert a string into a dash limited unique id from a piece of content. This
is useful for creating SEO friendly ids for user generated content such as blogs or forums based off post titles. 
All special characters will be striped from the string to a lower case alphanumeric id. A digit will be appended to the end
of the id in the event a string already exists to ensure uniqueness. This value will be incremented 1 for each
subsequent identical string that's created.

### Implementation:

Create seo column migration:

```ruby
 class CreateSeoTestModels < ActiveRecord::Migration
   def self.up
     create_table :seo_test_models do |t|
       t.string :name
       t.string :seo_id # default is :seo_friendly_id
       t.timestamps
     end
   end

   def self.down
     drop_table :seo_test_models
   end
 end
```

Add to model:

```ruby
 class SeoTestModel < ActiveRecord::Base
	acts_as_seo_friendly :resource_id => :name, 
						 :seo_friendly_id_field => :seo_id, # default is :seo_friendly_id
						 :seo_friendly_id_limit => 100 # default is 50
 end
```

A instance method will be added to the implemented class object:

```ruby
	foo = SeoTestModel.find_by_seo_id(params[:id])
	foo.seo_id
	"my-seo-friendly-id"
```

### Compatibility

	Ruby 2.0
	Rails 4.0
	Mysql

### Installation:

Add to Gemfile:

	gem 'acts_as_seo_friendly', :git => 'git://github.com/brooksjbr/acts_as_seo_friendly'

Run bundle:
	
	$ bundle


### Run specs 

	$ rspec spec/acts_as_seo_friendly


### License:

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.