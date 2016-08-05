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

  def respond_to?( sym, include_all=false )
    super || @pathname.respond_to?( sym, include_all )
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

    def initialize( env_dir, *script_classes )
      @path = Path.new( env_dir )
      @script_classes = script_classes
    end

    def make
      scripts = make_scripts( @path, @script_classes )

      @path.mkdir_p
      scripts.each do |script| script.render end

      make_gem_home()
      self
    end

    private

    def make_scripts( env_path, script_classes )
      script_classes.map { |cls| cls.new( env_path ) }
    end


    def make_gem_home
      gem_home_path.mkdir_p
    end


    def gem_home_path
      @path/"gem_home"
    end


  end
end
