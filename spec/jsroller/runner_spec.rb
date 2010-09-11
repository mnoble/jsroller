require File.dirname(__FILE__) + '/../spec_helper'

describe JSRoller::Runner do
  
  include JSRoller::SpecHelper
  
  it "should be creatable" do
    JSRoller::Runner.new.should_not be_nil
  end
  
  it "should transform command line flags to jslint options" do
    roller = JSRoller::Runner.new(["--css", "--evil", "example.js"])
    roller.collect_lint.should == "css: true, evil: true"
  end
  
  it "should transform the predef flag args into variable definitions" do
    roller = JSRoller::Runner.new(["--predef=a,b", "example.js"])
    roller.collect_globals.should == "var a = true;\nvar b = true;"
  end
  
  it "should collect all Lint" do
    roller = JSRoller::Runner.new(
      ["--css", "--predef=a,b", "--maxerr=4", "example.js"])
  end
  
  it "should read the file that is going to be run through JSLint" do
    stub_file_new
    File.should_receive(:new).with(File.expand_path('example.js'))
    JSRoller::Runner.new(["example.js"]).read_file_contents
  end
  
  it "should write to the tmp file" do
    stub_file_new
    File.stub!(:open)
    File.should_receive(:open)
    JSRoller::Runner.new(["example.js"]).write_file
  end
  
end