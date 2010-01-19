#!/usr/bin/ruby

ROOT = File.dirname(__FILE__)  unless defined?(ROOT)

require 'JavaParser'
require 'JavaLexer'

input = open(ARGV[0]) { |f| f.read }
lexer = JavaLexer.new(input)
parser = JavaParser.new(lexer)

parser.prog

