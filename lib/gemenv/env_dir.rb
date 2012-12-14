# encoding: utf-8

require 'pathname'
require 'fileutils'

class Path
  def initialize( dirname )
    @pathname = Pathname( dirname )
  end

  def mkdir_p
    FileUtils.mkdir_p( @pathname )
    self
  end

  def /(other)
    self.class.new( @pathname + other )
  end

  def write( str )
    File.open( self, "wb" ) { |f| f.write str }
    self
  end

  def method_missing( sym, *args, &blk )
    @pathname.__send__( sym, *args, &blk )
  end

  def respond_to?( sym )
    super || @pathname.respond_to?( sym )
  end

  def dirname
    self.class.new( @pathname.dirname )
  end

  def to_s
    @pathname.to_s
  end
end


module Gemenv
  class EnvDir
    attr_reader :path

    def initialize( env_dir, script_class )
      @path = Path.new( env_dir )
      @script_class = script_class
    end

    def make
      @path.mkdir_p
      
      make_activate()
      make_gem_home()
      self
    end

    private
    def make_activate
      activate_path.dirname.mkdir_p
      activate_path.write( activate_contents )
    end


    def make_gem_home
      gem_home_path.mkdir_p
    end


    def activate_path
      @path/"bin"/"activate"
    end

    def gem_home_path
      @path/"gem_home"
    end

    def activate_contents
      @script_class.new( @path ).to_bash
    end
      

  end
end
