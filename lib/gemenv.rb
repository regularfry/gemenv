# encoding: utf-8

require 'gemenv/activate_script'
require 'gemenv/env_dir'

module Gemenv
  class Application
    def initialize( argv )
      @env_dir = argv.shift
    end

    def run
      raise "Need an env dir!" unless @env_dir
      full_env_dir = File.expand_path( @env_dir )
      EnvDir.new( full_env_dir, ActivateScript ).make
    end
  end
end
