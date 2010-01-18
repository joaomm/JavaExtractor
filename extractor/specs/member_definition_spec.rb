require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "#{ROOT}/model/member_definition"

describe MemberDefinition do

  context "storing its informations" do
    before :each do
      @member = MemberDefinition.new
    end

    it 'should have a name' do
      @member.name = "member_name"
      @member.name.should == "member_name"
    end

    it 'should have a line' do
      @member.line = 9
      @member.line.should == 9
    end

    it "should have a type" do
      @member.type = 'my_type'
      @member.type.should == 'my_type'
    end

    it 'should store its modifiers' do
      @member.modifiers.should == []

      @member.add_modifier 'modifier1'
      @member.modifiers.should == ['modifier1']

      @member.add_modifier 'modifier2'
      @member.modifiers.should == ['modifier1', 'modifier2']
    end
  end

end

