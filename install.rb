require 'fileutils'

jslint = File.join(File.dirname(__FILE__), 'scripts', 'jslint.js')
roller = File.expand_path('~/.roller/')

FileUtils.mkdir(roller)
FileUtils.copy(jslint, roller)
FileUtils.chmod(0755, "#{ roller }/jslint.js")