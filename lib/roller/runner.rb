module Roller
  class Runner < Magni
    
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
    
    attr_accessor :lint
    
    def start
      @lint = "/*jslint #{ collect_lint } */"
    end
    
    def collect_lint
      @options.map { |opt| "#{ opt.first }: #{ opt.last }" }.join(", ")
    end
    
  end
end