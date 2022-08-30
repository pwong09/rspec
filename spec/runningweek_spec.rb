# prepare data and easily reference it in test examples

# three approaches to using let keyword
# 1. use let to define all object dependencies and keep body of examples minimal
# 2. use let occasionally to avoid duplication when you need to reference the same
# thing in multiple test examples
# 3. don't use let at all; rely on instance variables in before hooks only
describe RunningWeek do

  let(:monday_run) do
    Run.new(:duration => 32,
            :distance => 5.2,
            :timestamp => "2015-01-12 20:30")
  end

  let(:wednesday_run) do
    Run.new(:duration => 32,
            :distance => 5.2,
            :timestamp => "2015-01-14 19:50")
  end

  let(:runs) { |monday_run, wednesday_run| }

  let(:running_week) { RunningWeek.new(Date.parse("2015-01-12"), runs)}

  describe "#runs" do

    it "returns all runs in the week" do
      expect(running_week.runs).to eql(runs)
    end
  end

  describe "#first_run" do

    it "returns the first run in the week" do
      expect(running_week.first_run).to eql(monday_run)
    end
  end

  describe "#average_distance" do

    it "returns the average distance of all week's runs" do
      expect(running_week.average_distance).to be_within(0.1).of(5.4)
    end
  end

  describe "initialization" do

    context "given a date which is not a Monday" do

      it "raises a 'day not Monday' exception" do
        expect { RunningWeek.new(Date.parse("2015-01-13"), []) }.to raise_error("Day is not Monday")
      end
    end
  end
end
