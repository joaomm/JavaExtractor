require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "#{ROOT}/model/class_definition"


describe ClassDefinition do
  context "storing its information" do
    before :each do
      @classdef = ClassDefinition.new
    end

    it "should have a name" do
      @classdef.name = 'class_name'
      @classdef.name.should == 'class_name'
    end

    it "should have a list of members" do
      @classdef.members.should == []

      attribute = AttributeDefinition.new
      @classdef.add_member(attribute)
      @classdef.members.should == [attribute]

      method = MethodDefinition.new
      @classdef.add_member(method)
      @classdef.members.should == [attribute, method]
    end

     it 'should store its modifiers' do
      @classdef.modifiers.should == []

      @classdef.add_modifier 'modifier1'
      @classdef.modifiers.should == ['modifier1']

      @classdef.add_modifier 'modifier2'
      @classdef.modifiers.should == ['modifier1', 'modifier2']
    end

    it 'should store the inheritance' do
      @classdef.has_parent?.should == false
      @classdef.parent.should == nil

      @classdef.add_parent('parent_class')
      @classdef.has_parent?.should == true
      @classdef.parent.should == 'parent_class'
    end

    it "should store the interface" do
      @classdef.implements_interface?.should == false
      @classdef.interfaces.should == []

      @classdef.add_interface('interface_name')
      @classdef.implements_interface?.should == true
      @classdef.interfaces.should == ['interface_name']

      @classdef.add_interface('another_interface_name')
      @classdef.implements_interface?.should == true
      @classdef.interfaces.should == ['interface_name', 'another_interface_name']
    end
  end

  context "reporting information" do
    before :each do
      @classdef = ClassDefinition.new
      @classdef.name = 'class_name'
    end

    it "should report its name" do
      @classdef.report.should match(/class class_name/)
    end

    it "should report its members" do
      @classdef.report.should_not match(/attribute/)
      @classdef.report.should_not match(/method/)

      attribute = AttributeDefinition.new
      attribute.name = 'attribute_name'
      attribute.line = 1
      @classdef.add_member(attribute)
      @classdef.report.should match(/attribute attribute_name in line 1/)

      method = MethodDefinition.new
      method.name = 'method_name'
      method.line = 4
      @classdef.add_member(method)
      @classdef.report.should match(/method method_name in line 4/)
     end

    it "should report its modifiers" do
      @classdef.report.should_not match /modifier/

      @classdef.add_modifier 'modifier1'
      @classdef.report.should match /modifier modifier1/

      @classdef.add_modifier 'modifier2'
      @classdef.report.should match /modifier modifier2/
    end

    it "should report its parent" do
      @classdef.report.should_not match /extends/

      @classdef.add_parent('parent_class')
      @classdef.report.should match /extends parent_class/
    end

    it "should report its interfaces" do
      @classdef.report.should_not match /implements/

      @classdef.add_interface 'interface_name'
      @classdef.report.should match /implements interface_name/

      @classdef.add_interface 'another_interface_name'
      @classdef.report.should match /implements another_interface_name/
    end


  end

end

