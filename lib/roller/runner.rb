module Roller
  class Runner < Magni
    
    RHINO  = "java org.mozilla.javascript.tools.shell.Main"
    JSLINT = "~/.roller/jslint.js"
    
    map :last        => :file
    map "--adsafe"   => :boolean
    map "--bitwise"  => :boolean
    map "--browser"  => :boolean
    map "--cap"      => :boolean
    map "--css"      => :boolean
    map "--debug"    => :boolean
    map "--devel"    => :boolean
    map "--eqeqeq"   => :boolean
    map "--evil"     => :boolean
    map "--forin"    => :boolean
    map "--fragment" => :boolean
    map "--immed"    => :boolean
    map "--indent"   => :integer
    map "--laxbreak" => :boolean
    map "--maxerr"   => :integer
    map "--maxlen"   => :integer
    map "--nomen"    => :boolean
    map "--newcap"   => :boolean
    map "--on"       => :boolean
    map "--onevar"   => :boolean
    map "--passfail" => :boolean
    map "--plusplus" => :boolean
    map "--predef"   => :array
    map "--regexp"   => :boolean
    map "--rhino"    => :boolean
    map "--safe"     => :boolean
    map "--strict"   => :boolean
    map "--sub"      => :boolean
    map "--undef"    => :boolean
    map "--white"    => :boolean
    map "--widget"   => :boolean
    map "--windows"  => :boolean
    
    attr_accessor :lint, :lintee
    
    # Ya! Party starta!
    def start
      assemble_lint
      write_lint
      run
    end
    
    # Pulls together the pieces that JSLint needs to run. This includes
    # the configuration "frontmatter", global variables to be defined and
    # the actual JavaScript file's content.
    #
    def assemble_lint
      @lint =  "/*jslint #{ collect_lint } */\n"
      @lint << collect_globals
      @lint << read_file
    end
    
    # Writes all the Lint to a tmp file. This will be the actual file
    # that gets sent to JSLint.
    #
    def write_file
      File.open("/tmp/jslint", "w+") { |file| file << @lint }
    end
    
    # The part that will make you cry because you realize your JavaScript
    # is horribly formatted, at least in JSLint's mind.
    #
    def run
      system("#{ RHINO } #{ JSLINT } /tmp/jslint")
    end
    
    # Takes each command line JSLint flag and turns it into the
    # format used in the JSLint "frontmatter".
    #
    def collect_lint
      @options.map { |opt| "#{ opt.first }: #{ opt.last }" }.join(", ")
    end
    
    # Grabs the variables passed via the <tt>--predef</tt> flag and
    # collects each one's JavaScript declaration into an array.
    #
    def collect_globals
      @options.delete(:predef).map { |name| "var #{name}=true" }.join(";\n")
    end
    
    # Reads in the contents of the file that needs to be sent through
    # JSLint.
    #
    def read_file
      @lintee = File.new(File.expand_path(@file)).read
    end
    
  end
end