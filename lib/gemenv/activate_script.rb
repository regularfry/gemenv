# encoding: utf-8
require 'erb'

module Gemenv
  class ActivateScript
    def initialize( env_dir )
      @env_dir = env_dir
    end

    def to_bash
      here = File.dirname( __FILE__ )
      template_filename = File.join( here, "activate.erb" )
      template = File.read( template_filename )
      ERB.new( template ).result( binding )
    end

  end
end
