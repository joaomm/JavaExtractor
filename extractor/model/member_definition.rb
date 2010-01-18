class MemberDefinition
  attr_reader :modifiers
  attr_accessor :name, :line, :type

  def initialize
    @modifiers = []
  end

  def add_modifier(modifier)
    @modifiers << modifier
  end

end

