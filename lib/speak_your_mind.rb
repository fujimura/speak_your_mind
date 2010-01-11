require 'test/unit'
require 'test/unit/ui/testrunnermediator'
require 'test/unit/ui/testrunnerutilities'
require 'rubygems' 
require 'redgreen'
module SpeakYourMind
  module Test::Unit 

    class TestCase 
      def name
        if (defined? Shoulda) &&  (self.class.include? Shoulda::InstanceMethods)
          @method_name.gsub /test: /,""
        else 
          @method_name 
        end 
      end
    end

    class Failure
      def expectation_display 
        Color.red "F " +  @test_name 
      end
    end

    class Error 
      def expectation_display
        Color.yellow "E " +  @test_name
      end
    end 


    module UI
      module Console
        class TestRunner
          extend TestRunnerUtilities
          def add_fault(fault)
            @faults << fault
            output(fault.expectation_display, PROGRESS_ONLY)
            @already_outputted = true
          end
          def test_finished(name)
            output(Color.green(". " + name), PROGRESS_ONLY) unless (@already_outputted)
            nl(VERBOSE)
            @already_outputted = false
          end
        end
      end
    end

  end 
end 
