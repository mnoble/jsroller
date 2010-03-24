lib = File.dirname(__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'magni'

module Roller
  VERSION = '0.0.1'
  autoload :Runner, 'roller/runner'
end