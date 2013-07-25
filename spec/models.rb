class WidgetDefault < ActiveRecord::Base
  
  self.table_name = "widgets"
  acts_as_seo_friendly :resource_id => :name,
                       :seo_friendly_id_field => :unique_id
end

class WidgetSetLimit < ActiveRecord::Base
  
  self.table_name = "widgets"
  acts_as_seo_friendly :resource_id => :name,
                       :seo_friendly_id_field => :unique_id,
                       :seo_friendly_id_limit => 25
end


class WidgetBeforeSave < ActiveRecord::Base
  
  self.table_name = "widgets" 
  
  acts_as_seo_friendly :resource_id => :name, 
                       :seo_friendly_id_field => :unique_id, 
                       :seo_friendly_id_limit => 50,
                       :do_before_save => true
end

class WidgetBeforeCreate < ActiveRecord::Base
  
  self.table_name = "widgets" 
  
  acts_as_seo_friendly :resource_id => :name, 
                       :seo_friendly_id_field => :unique_id, 
                       :seo_friendly_id_limit => 50,
                       :do_before_create => true
end

class WidgetAfterSave < ActiveRecord::Base
  
  self.table_name = "widgets" 
  
  acts_as_seo_friendly :resource_id => :name, 
                       :seo_friendly_id_field => :unique_id, 
                       :seo_friendly_id_limit => 50,
                       :do_after_save => true
end
