require "#{ROOT}/model/member_definition"

class AttributeDefinition < MemberDefinition

  def report
      output = "   attribute #{name} in line #{line}\n"
      output += "      type #{type}\n"
      @modifiers.each do |modifier|
        output += "      modifier #{modifier}\n"
      end
      output
  end

  def copy_modifiers_from(attribute)
    attribute.modifiers.each do |modifier|
      @modifiers << modifier
    end
  end

end

