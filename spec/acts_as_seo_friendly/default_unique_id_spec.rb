require 'spec_helper'

describe "default unique id generation" do
  
  before do
    @widget = WidgetDefault.create(:name => "create seo friendly id")
  end
  
  subject { @widget }
  
  it { should respond_to :unique_id }
  
  describe "strip out special characters, spaces, or truncate strings" do
      
    before do
      clean_database!
    end
  
    it "generates seo friendly id without comma" do
      widget = WidgetDefault.create(:name => "Hi There! What's up y'all")
      widget.unique_id.should eql("hi-there-whats-up-yall")
    end
  
    it "generates seo friendly id without commas and spaces" do
      widget = WidgetDefault.create(:name => "Hi There!    What's up y'all")
      widget.unique_id.should eql("hi-there-whats-up-yall")
    end

    it "generates seo friendly id without commas" do
      widget = WidgetDefault.create(:name => "Hi There What's up y'all")
      widget.unique_id.should eql("hi-there-whats-up-yall")
    end
  
    it "generates seo friendly id without commas" do
      widget = WidgetDefault.create(:name => "Hi There What's up y'all")
      widget.unique_id.should eql("hi-there-whats-up-yall")
    end
  
    it "generates seo friendly id ignores single dashes" do
      widget = WidgetDefault.create(:name => "Hi There What-s up y-all")
      widget.unique_id.should eql("hi-there-what-s-up-y-all")
    end

    it "generates seo friendly id removes multiple dashes" do
      widget = WidgetDefault.create(:name => "Hi There What---s up y-all")
      widget.unique_id.should eql("hi-there-what-s-up-y-all")
    end
  
    it "generates seo friendly id removes multiple dashes and special characters" do
      widget = WidgetDefault.create(:name => "Hi There What---s up y-all!")
      widget.unique_id.should eql("hi-there-what-s-up-y-all")
    end
  
    it "generates truncated seo friendly id with a 50 character limit on longer strings" do
      widget = WidgetDefault.create(:name => "Hi There! What's up y'all, Howdy there, whatcha doing, whatcha up to?")
      expect(widget.unique_id.length).to be <= 50
      widget.unique_id.should eql("hi-there-whats-up-yall-howdy-there-whatcha")
    end
    
    it "generates truncated seo friendly id with a 50 character limit on longer strings without spaces" do
      widget = WidgetDefault.create(:name => "onecontinuouslylongwordalskdjflaskjfdlaskdfjlkjsdjsdflkjasdfljlaskdjfallskdfajsdkfj")
      widget.unique_id.length.should be(46)
      widget.unique_id.should eql("onecontinuouslylongwordalskdjflaskjfdlaskdfjlk")
    end
    
  end
  
  describe "seo friendly ids are unique" do
    it "generates unique id from same passed in string" do
      widget = WidgetDefault.create(:name => "this is a test")
      widget.unique_id.should eql("this-is-a-test")
      
      widget = WidgetDefault.create(:name => "this is a test")
      widget.unique_id.should eql("this-is-a-test-1")
    end
  end
  
  describe "seo friendly to_param" do
    it {expect(WidgetDefault.new.to_param).to be_nil}
    text_name = "String testing for unique Id!"
    
    widget = WidgetDefault.create!(:name => text_name)
    it {expect(widget.to_param).to eq("string-testing-for-unique-id")}
    it {expect(text_name).to eq(widget.name)}
  end
  
  describe "seo friendly id update on name change" do
    before do
      clean_database!
      text_name = "testing this thing"
      @widget = WidgetDefault.create!(name: text_name)
    end
    
    it "create seo friendly id" do
      expect(@widget.name).to eq("testing this thing")
      expect(@widget.unique_id).to eq("testing-this-thing")
    end
    
    it "before create seo friendly id is not updated" do
      @widget.update_attributes!(name: "s@mething else to test w1th")
      expect(@widget.unique_id).to eq("s-mething-else-to-test-w1th")
    end
  end
  
  describe "seo friendly collision with original id" do
    before do
      clean_database!
      names = ["a 1", "a 1/2", "a 1/4", "a 1", "a 1"]

      names.each do |name|
        WidgetDefault.create!(:name => name)
      end
    end
    
    it "seo friendly no collisions" do
      uids = WidgetDefault.all.collect! {|w| w.unique_id}
      expect(uids.length).to be(5)
    end
  end

end
