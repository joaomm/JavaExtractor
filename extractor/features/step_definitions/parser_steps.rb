require 'fileutils'

Given /^I am in (.+)$/ do |dir|
  FileUtils.cd(dir)
end

When /^I run "([^\"]*)" with "([^\"]*)"$/ do |command, file|
  system("#{command} samples/#{file} >tmp.out 2>tmp.err")
  if $?.is_a?(Fixnum)
    @exit_status = $?
  else
    @exit_status = $?.exitstatus
  end
  @stdout = File.readlines('tmp.out')
  @stderr = File.readlines('tmp.err')
end

class ThingNotReported < ParserException; end

Then /^our parser must report the existence of "([^\"]*)"$/ do | thing |
  if (@stdout.select { |line| line =~ /#{thing}/ }).size < 1
    raise ThingNotReported.new(@stdout, @stderr)
  end
end

Then /^our parser must report the existence of "([^\"]*)" with "([^\"]*) ([^\"]*)"$/ do | member, qualifier_type, qualifier|
  line = (0...(@stdout.size)).find { |i| @stdout[i] =~ /#{member}/ }
  found = false
  if line
    for i in (line+1...(@stdout.size))
      if not @stdout[i] =~ /[#{qualifier_type}]/
        break
    elsif @stdout[i] =~ /#{qualifier_type} #{qualifier}/
        found = true
      end
    end
  end
  raise ThingNotReported.new(@stdout, @stderr) if found == false
end

After do
  FileUtils.rm_f('tmp.out')
  FileUtils.rm_f('tmp.err')
end

