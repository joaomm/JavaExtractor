require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "#{ROOT}/model/parameter_definition"

describe ParameterDefinition do

  context "reporting its declaration" do
    before :each do
      @parameter = ParameterDefinition.new
      @parameter.name = "parameter_name"
      @parameter.type = 'my_type'
    end

    it "should report its name" do
      @parameter.report.should match(/parameter #{@parameter.name}/)
    end

    it "should report its type" do
      @parameter.report.should match(/type #{@parameter.type}/)
    end

    it "should report its modifiers" do
      @parameter.report.should_not match(/modifier/)

      @parameter.add_modifier 'modifier1'
      @parameter.report.should match(/modifier modifier1/)

      @parameter.add_modifier 'modifier2'
      @parameter.report.should match(/modifier modifier2/)
    end
  end
end

