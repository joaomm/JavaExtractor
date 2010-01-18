require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "#{ROOT}/model/local_variable_definition"

describe LocalVariableDefinition do
  context "storing information" do
      it "should store if it was initialized" do
        variable = LocalVariableDefinition.new
        variable.was_initialized?.should == false

        variable.was_initialized
        variable.was_initialized?.should == true
      end
  end


  context "reporting declaration" do
    before :each do
      @variable = LocalVariableDefinition.new
      @variable.name = "variable_name"
      @variable.line = 10
    end

    it "should report its name and line" do
      @variable.report.should match /local variable variable_name in line 10/
    end

    it "should report its type" do
      @variable.report.should_not match /type/

      @variable.type = "type_name"
      @variable.report.should match /type type_name/
    end

    it "should report its modifiers" do
      @variable.report.should_not match /modifier/
      @variable.add_modifier("final")
      @variable.add_modifier("annotation")
      @variable.report.should match /modifier final/
      @variable.report.should match /modifier annotation/
    end
  end
end

