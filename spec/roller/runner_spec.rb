require File.dirname(__FILE__) + '/../spec_helper'

describe Roller::Runner do
  
  it "should be creatable" do
    Roller::Runner.new.should_not be_nil
  end
  
  it "should transform command line flags to jslint options" do
    roller = Roller::Runner.new(["--css", "--evil"])
    roller.start
    roller.lint.should == "/*jslint css: true, evil: true */"
  end
  
end