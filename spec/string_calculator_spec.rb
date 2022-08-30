require "string_calculator"
# can always describe the behavior of classes, modules, and their methods
describe StringCalculator do
  # by convention class methods are prefixed with a dot (.add)
  # instance methods are prefixed with a dash (#add)
  describe ".add" do
    # describe the context under which .add is expected to return 0
    context "given an empty string" do
      # it block describes a specific example aka test case
      it "returns zero" do
        # define the expected outcome, given an expression and combined matcher
        # to fully define the expectation on a piece of code
        expect(StringCalculator.add("")).to eq(0)
      end
    end

    context "two numbers" do
      context "given '2,4'" do
        it "returns 6" do
          expect(StringCalculator.add("2,4")).to eq(6)
        end
      end

      context "given '17,100'" do
        it "returns 117" do
          expect(StringCalculator.add("17,100")).to eq(117)
        end
      end
    end
  end
end
