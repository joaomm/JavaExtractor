require "#{ROOT}/model/attribute_definition"
require "#{ROOT}/model/method_definition"

class ClassDefinition
  attr_reader :members, :modifiers, :parent, :interfaces
  attr_accessor :name

  def initialize
    @members = []
    @modifiers = []
    @interfaces = []
    @parent = nil
  end

  def add_member(member)
    @members << member
  end

  def add_modifier(modifier)
    @modifiers << modifier
  end

  def report
    output = ""
    output << report_name
    output << report_parent
    output << report_interfaces
    output << report_modifiers
    output << report_members
  end

  def has_parent?
    return true if @parent != nil
    false
  end

  def add_parent(parent)
    @parent = parent
  end

  def implements_interface?
    return false if @interfaces.empty?
    true
  end

  def add_interface(interface)
    @interfaces << interface
  end

  private

  def report_name
    "class #{@name}\n"
  end

  def report_parent
    parent = ""
    parent << "   extends #{@parent}\n" if @parent != nil
    parent
  end

  def report_interfaces
    interfaces = ""
    @interfaces.each do |interface|
      interfaces << "   implements #{interface}\n"
    end
    interfaces
  end

  def report_modifiers
    modifiers = ""
    @modifiers.each do |modifier|
      modifiers << "   modifier #{modifier}\n"
    end
    modifiers
  end

  def report_members
    members = ""
    @members.each do |member|
      members << member.report
    end
    members
  end

end

