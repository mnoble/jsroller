require File.dirname(__FILE__) + '/../spec_helper'

describe Roller::Runner do
  
  include Roller::SpecHelper
  
  it "should be creatable" do
    Roller::Runner.new.should_not be_nil
  end
  
  it "should transform command line flags to jslint options" do
    roller = Roller::Runner.new(["--css", "--evil", "example.js"])
    roller.collect_lint.should == "css: true, evil: true"
  end
  
  it "should handle array command line flags properly" do
    roller = Roller::Runner.new(["--predef=a,b", "example.js"])
    roller.collect_globals.should == "var a=true;\nvar b=true"
  end
  
  it "should read the file that is going to be run through JSLint" do
    stub_file_new
    File.should_receive(:new).with(File.expand_path('example.js'))
    Roller::Runner.new(["example.js"]).read_file
  end
  
  it "should write to the tmp file" do
    stub_file_new
    File.stub!(:open)
    File.should_receive(:open)
    Roller::Runner.new(["example.js"]).write_file
  end
  
end