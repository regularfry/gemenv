# encoding: utf-8

require 'test/helper'
require 'gemenv/activate_script'

module Gemenv
  class TestActivateScript < Test::Unit::TestCase
    def test_builds_activate_bash_content
      script = ActivateScript.new( "foobar" )
      assert_match /^VIRTUAL_ENV=.*foobar/, script.to_bash
    end
  end
end
