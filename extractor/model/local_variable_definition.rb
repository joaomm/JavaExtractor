require "#{ROOT}/model/member_definition"

class LocalVariableDefinition < MemberDefinition

  def initialize
    super
    @initialized = false
  end

  def was_initialized?
    @initialized == true
  end

  def was_initialized
    @initialized = true
  end

  def report
    output = "      local variable #{@name} in line #{@line}\n"
    output << "         type #{@type}\n" if @type != nil
    @modifiers.each do |modifier|
      output << "         modifier #{modifier}\n"
    end
    output
  end

end

