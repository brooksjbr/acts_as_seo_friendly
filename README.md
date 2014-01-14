## ActsAsSeoFriendly

This is a fork of revolutionhealth-acts_as_seo_friendly gem. This fork maintains all original functionality and is purely an upgrade for compatibility with rails 4.

### DESCRIPTION:

Create an SEO friendly field for a model automatically based on a given field.

So if you have a Blogs model, and you would like create an SEO friendly version 
of the 'title' field, you would just add this to your model and then be able to 
use the SEO friendly id as the unique id to the resource.  The plugin will only
append an integer to the SEO id if there is a collision.

### SYNOPSIS:

Create seo column migration:

```ruby
 class CreateSeoTestModels < ActiveRecord::Migration
   def self.up
     create_table :seo_test_models do |t|
       t.string :name
       t.timestamps
     end
	 SeoTestModel.create_seo_friendly_column()
   end

   def self.down
	 SeoTestModel.drop_seo_friendly_column()
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

To lookup the resource in the controllers use:

  SeoTestModel.find_by_seo_id(params[:id])

### Compatibility

	Ruby 2.0
	Rails 4.0

### INSTALLATION:

Add to Gemfile:

	gem 'acts_as_seo_friendly', :git => 'git://github.com/brooksjbr/acts_as_seo_friendly'


	$ bundle


### RUN SPEC TESTS 

	$ rspec spec/acts_as_seo_friendly


### LICENSE:

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