require File.dirname(__FILE__) + '/../lib/roller'

module Roller
  module SpecHelper
    
    class FakeJSFile
      def read
        "(function() { console.log('winner!'); })()"
      end
    end
    
    def stub_file_new
      File.stub!(:new).and_return(FakeJSFile.new)
    end
  end
end