require_relative '../lib/two_fer.rb'

RSpec.describe HelloWorld do

	it "No name given" do
		expect(TwoFerTest.two_fer()).to eq("One for you, one for me.")
	end
	it "Alice" do
		expect(TwoFerTest.two_fer("Alice")).to eq("One for Alice, one for me.")
	end
	it "Bob" do
		expect(TwoFerTest.two_fer("Bob")).to eq("One for Bob, one for me.")
	end
end
