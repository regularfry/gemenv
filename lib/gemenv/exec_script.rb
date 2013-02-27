# encoding: utf-8

require 'gemenv/generated_script'

module Gemenv
  class ExecScript < GeneratedScript
    def render
      super
      target_filename.chmod(0755)
    end
  end
end # module Gemenv
