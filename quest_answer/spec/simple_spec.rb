RSpec.describe "simple spec" do
	#математическую функцию
	describe "math" do
		it "should be abe to perform base math" do
			expect(9 * 10).to eq(90)
		end
	end
	#тестируем класс
	describe String do
		let(:string) {String.new} 
		#string = String.new
		it "should be equal to an empty string" do
			expect(string).to eq("")
		end
	end
end