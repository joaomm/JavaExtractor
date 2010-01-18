require "#{ROOT}/model/member_definition"

class ParameterDefinition < MemberDefinition

  def report
    output = "      parameter #{name}\n"
    output += "         type #{type}\n"
    @modifiers.each do |modifier|
      output += "         modifier #{modifier}\n"
    end
    output
  end

end

