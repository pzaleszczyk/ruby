require_relative "../lib/hello_world.rb"

RSpec.describe HelloWorld do
	describe ".hello" do
		it("Testowanie - Hello, World!") do
				expect(HelloWorld.hello).to eq("Hello, World!")
		end
	end
end
