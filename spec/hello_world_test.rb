require_relative "../lib/hello_world.rb"

RSpec.describe HelloWorld do
    it("Testowanie - Hello, World!") do
            expect(HelloWorld.hello).to eq("Hello, World!")
    end
end