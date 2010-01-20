require "#{ROOT}/model/member_definition"

class MethodDefinition < MemberDefinition
  attr_reader :parameters, :local_variables

  def initialize
    @modifiers = []
    @parameters = []
    @local_variables = []
    @uses = []
    @type = 'constructor'
  end

  def add_parameter(parameter)
    @parameters << parameter
  end

  def add_local_variable(variable)
    @local_variables << variable
  end

  def report
      output = "   method #{name} in line #{line}\n"
      output += "      type #{type}\n"
      @modifiers.each do |modifier|
        output << "      modifier #{modifier}\n"
      end
      @parameters.each do |parameter|
        output << parameter.report
      end
      @local_variables.each do |local|
        output << local.report
      end
      @uses.each do |use|
        output << "      uses #{use[0]} #{use[1]} in line #{use[2]}\n"
      end

      output
  end

  def add_use_of(variable_name, line)
    @parameters.each do |parameter|
      return @uses << ["parameter", variable_name, line] if parameter.name == variable_name
    end
    @local_variables.each do |local|
      return @uses << ["local variable", variable_name, line] if local.name == variable_name
    end
    if variable_name =~ /this\.(.*)/
      variable_name = $1
    end
    @uses << ["attribute", variable_name, line]
  end

  def add_method_call(method_name, line)
     @uses << ["method", method_name, line]
  end

end

