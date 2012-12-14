# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'gemenv/version'

Gem::Specification.new do |s|
  s.name        = "gemenv"
  s.version     = Gemenv::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alex Young"]
  s.email       = ["alex@bytemark.co.uk"]
  s.homepage    = "http://github.com/regularfry/gemenv"
  s.summary     = "The best way to contain your dependencies"
  s.description = "Gemenv provides a container for your gems, "\
    "and otherwise stays out of your way."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "gemenv"

  s.files        = Dir.glob("{bin,lib}/**/*") + 
    %w(LICENSE.txt README.md)
  s.executables  = ['gemenv']
  s.require_path = 'lib'
end
