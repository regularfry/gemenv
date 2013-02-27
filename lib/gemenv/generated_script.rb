# encoding: utf-8

require 'erb'

module Gemenv
  class GeneratedScript
    def self.template_basename
      self.target_basename + ".erb"
    end

    def self.target_basename
      self.name.split("::").last.
        sub("Script", '').
        gsub(/([a-z])([A-Z])/, '\1_\2').
        downcase
    end


    def self.template
      here = File.dirname( __FILE__ )
      template_filename = File.join( here, template_basename )
      template = File.read( template_filename )
    end


    attr_reader :env_path

    def initialize( env_path )
      @env_path = env_path
    end

    def to_bash
      ERB.new( self.class.template ).result( binding )
    end


    def mkdir
      target_filename.dirname.mkdir_p
    end

    def target_filename
      env_path/"bin"/self.class.target_basename
    end


    def render
      mkdir
      target_filename.write( to_bash )
    end

  end
end
