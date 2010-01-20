require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "#{ROOT}/model/method_definition"
require "#{ROOT}/model/parameter_definition"
require "#{ROOT}/model/local_variable_definition"

describe MethodDefinition do

  context "storing its informations" do
    before :each do
      @method = MethodDefinition.new
    end

    it "should have a list of parameters" do
      @method.parameters.should == []

      parameter = ParameterDefinition.new
      parameter.name = 'parameter_name'
      @method.add_parameter parameter
      @method.parameters[0].name.should == 'parameter_name'

      parameter = ParameterDefinition.new
      parameter.name = 'another_parameter_name'
      @method.add_parameter parameter
      @method.parameters[0].name.should == 'parameter_name'
      @method.parameters[1].name.should == 'another_parameter_name'
    end

    it "should have a initial type constructor" do
      @method.type.should == 'constructor'
    end

    it "should store the definition of local_variables" do
      @method.local_variables.should == []

      variable = LocalVariableDefinition.new
      variable.name = 'variable_name'
      @method.add_local_variable(variable)
      @method.local_variables[0].name.should == 'variable_name'

      variable = LocalVariableDefinition.new
      variable.name = 'another_variable_name'
      @method.add_local_variable(variable)
      @method.local_variables[1].name.should == 'another_variable_name'
    end
  end

  context "reporting its informations" do
    before :each do
      @method = MethodDefinition.new
      @method.name = 'method_name'
      @method.line = 9
      @method.type = 'my_type'
    end

    it "should report its name" do
      @method.report.should match(/method #{@method.name} in line #{@method.line}/)
    end

    it "should report its type" do
      @method.report.should match(/type #{@method.type}/)
    end

    it "should report its modifiers" do
      @method.report.should_not match /modifier/

      @method.add_modifier 'modifier1'
      @method.report.should match /modifier modifier1/

      @method.add_modifier 'modifier2'
      @method.report.should match /modifier modifier2/
    end

    it "should report its parameters" do
      @method.report.should_not match /\s{6}parameter/

      parameter = ParameterDefinition.new
      @method.add_parameter(parameter)
      @method.report.should match /parameter/
    end

    it "should report its local_variables" do
      @method.report.should_not match /\s{6}local variable/

      local_variable = LocalVariableDefinition.new
      local_variable.name = "local_variable_name"
      local_variable.line = 6
      @method.add_local_variable(local_variable)
      @method.report.should match /local variable local_variable_name in line 6/
    end
  end

  context "adding and reporting the use of variable in general" do
    before :each do
      @method = MethodDefinition.new
    end

    it "should report the use of parameters" do
      @method.report.should_not match /uses/

      parameter = ParameterDefinition.new
      parameter.name = "parameter_name"
      @method.add_parameter parameter

      @method.add_use_of('parameter_name', 9)
      @method.report.should match /uses parameter parameter_name in line 9/

      parameter = ParameterDefinition.new
      parameter.name = "another_parameter_name"
      @method.add_parameter parameter

      @method.add_use_of('another_parameter_name', 5)
      @method.report.should match /uses parameter another_parameter_name in line 5/

      @method.add_use_of('not_parameter_name', 10)
      @method.report.should_not match /uses parameter not_parameter_name in line 10/
    end

    it "should report the use of local variables" do
      local_variable = LocalVariableDefinition.new
      local_variable.name = 'local_variable_name'
      @method.add_local_variable local_variable

      @method.add_use_of("local_variable_name", 10)
      @method.report.should match /uses local variable local_variable_name in line 10/

      local_variable = LocalVariableDefinition.new
      local_variable.name = 'another_local_variable_name'
      @method.add_local_variable local_variable

      @method.add_use_of("another_local_variable_name", 9)
      @method.report.should match /uses local variable another_local_variable_name in line 9/

      @method.add_use_of('not_local_variable_name', 10)
      @method.report.should_not match /uses parameter not_local_variable_name in line 10/
    end

    it "should report the use of attributes" do
      @method.add_use_of("attribute_name", 10)
      @method.report.should match /uses attribute attribute_name in line 10/

      @method.add_use_of("this.another_attribute_name", 10)
      @method.report.should match /uses attribute another_attribute_name in line 10/

    end
  end

  context "adding and reporting method calls" do
    before :each do
      @method = MethodDefinition.new
    end

    it "should add and report the use of a method" do
      @method.report.should_not match /uses method/

      @method.add_method_call("my_method", 8)
      @method.report.should match /uses method my_method in line 8/
    end
  end

end

