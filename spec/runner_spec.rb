describe Run do

  describe "attributes" do

    # subject is an instance of class Run
    # we refer to same subject with multiple test examples
    # Rspec treats subject as an object which should
    # respond to a number of methods (like duration)
    subject do
      Run.new(:duration => 32,
              :distance => 5.2,
              :timestamp => "2014-12-22 20:30")
    end

    it { is_expected.to respond_to(:duration) }
    it { is_expected.to respond_to(:distance) }
    it { is_expected.to respond_to(:timestamp) }

    # another way to write the above
    # it "responds to '#duration'" do
    #   expect(subject).to respond_to(:duration)
    # end

    # can reference subject explicitly
    # but not recommended
    # describe "#timestamp" do
    #   it "returns a DateTime" do
    #     expect(subject.timestamp).to be_a(DateTime)
    #   end
    # end
  end

  describe ".count" do

    context "with 2 logged runs this week and 1 in next week" do
      # equivalent of writing before(:each) or
      # run this code before each example
      # can write before(:all)
      # run code only once for given context
      before do
        2.times do
          Run.log(:duration => rand(10),
                  :distance => rand(8),
                  :timestamp => "2015-01-12 20:30")
        end

        Run.log(:duration => rand(10),
                :distance => rand(8),
                :timestamp => "2015-01-19 20:30")
      end

      context "without arguments" do
        it "returns 3" do
          expect(Run.count()).to eql(3)
        end
      end

      context "with :week set to this week" do
        it "returns 2" do
          expect(Run.count(:week => "2015-01-12 20:30")).to eql(2)
        end
      end
    end
  end
end
