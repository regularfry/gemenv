# encoding: utf-8

require 'tmpdir'
require 'pathname'

require 'test/helper'
require 'gemenv/env_dir'


class FakeScript
  def initialize( _ )
  end

  def to_bash
    "Script Contents!"
  end
end


module Gemenv
  class TestEnvDir < ::Test::Unit::TestCase
    def test_builds_dir_structure
      Dir.mktmpdir("envdir") do |tmpdir|
        env_dirname = File.join( tmpdir, "foobar" )
        env_dir = EnvDir.new( env_dirname, FakeScript )
        env_dir.make

        assert_equal( File.expand_path( env_dirname ),
                      File.expand_path( env_dir.path ) )
        assert env_dir.path.directory?, "No env dir made!"

        assert (env_dir.path/"bin"/"activate").exist?, "No activate script!"
        assert (env_dir.path/"gem_home").exist?, "No gem_home!"
      end
    end
  end
end
