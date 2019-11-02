require_relative '../lib/two_fer.rb'

RSpec.describe TwoFer do
	it "No name given" do
		expect(TwoFer.two_fer()).to eq("One for you, one for me.")
	end
	it "Alice" do
		expect(TwoFer.two_fer("Alice")).to eq("One for Alice, one for me.")
	end
	it "Bob" do
		expect(TwoFer.two_fer("Bob")).to eq("One for Bob, one for me.")
	end
end
