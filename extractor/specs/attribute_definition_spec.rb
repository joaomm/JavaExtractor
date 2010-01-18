require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "#{ROOT}/model/attribute_definition"

describe AttributeDefinition do

  context "reporting its informations" do
    before :each do
      @attribute = AttributeDefinition.new
      @attribute.name = "attribute_name"
      @attribute.line = 9
      @attribute.type = 'my_type'
    end

    it "should report its name" do
      @attribute.report.should match /attribute #{@attribute.name} in line #{@attribute.line}/
    end

    it "should report its type" do
      @attribute.report.should match /type #{@attribute.type}/
    end

    it "should report its modifiers" do
      @attribute.report.should_not match /modifier/

      @attribute.add_modifier 'modifier1'
      @attribute.report.should match /modifier modifier1/

      @attribute.add_modifier 'modifier2'
      @attribute.report.should match /modifier modifier2/
    end
  end



  context "copying information" do
    before :each do
      @attribute = AttributeDefinition.new
    end

    it "should copy its type" do
      @attribute.type = 'my_type'
      attribute_copy = AttributeDefinition.new
      attribute_copy.type = @attribute.type
      attribute_copy.type.should == 'my_type'
    end

    it "should copy its modifiers" do
      attribute_copy = AttributeDefinition.new
      @attribute.add_modifier('my_modifier')
      attribute_copy.copy_modifiers_from(@attribute)
      attribute_copy.modifiers.should == ['my_modifier']

      attribute_copy = AttributeDefinition.new
      @attribute.add_modifier('another_modifier')
      attribute_copy.copy_modifiers_from(@attribute)
      attribute_copy.modifiers.should == ['my_modifier', 'another_modifier']
    end
  end


end

