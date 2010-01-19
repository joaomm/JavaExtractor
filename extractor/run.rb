#!/usr/bin/ruby

require 'fileutils'
ROOT = File.dirname(__FILE__)


FileUtils.cd('specs/')
system 'spec . -c --format specdoc'


FileUtils.cd('..')

puts "\n\n\n\n"
system 'antlr3 Java.g'
puts "\n\n\n\n"

text = open("JavaParser.rb") { |f| f.read }
doc = 'require "#{ROOT}/model/class_definition"' + "\n" +
      'require "#{ROOT}/model/attribute_definition"' + "\n" +
      'require "#{ROOT}/model/parameter_definition"' + "\n" +
      'require "#{ROOT}/model/local_variable_definition"' + "\n" +
      'require "#{ROOT}/model/method_definition"' + "\n\n" + text
File.open("JavaParser.rb", 'w') {|f| f.write(doc) }

feature = ARGV[0]

if feature
  system "cucumber features/#{feature}"
else
  system "cucumber features/testing; cucumber features/hello_world"
end

