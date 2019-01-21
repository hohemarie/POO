require_relative '../lib/user'

describe "the User class" do 
	it "contains users" do

	before(:each) do
	
	
		Object.send(:remove_const, 'User')
		load 'user.rb'
	end
	describe 'the initializer method' do 
	
		it 'creates an user' do
			#user = User.new("email@email.com")
			expect(user.class).to eq(User)
		end
	end
	describe "the update_email method" do
		it 'updates the email' do
			expect(update_email(email_to_update).to eq(email))
			expect(read_email).to eq(email)
			expect(User.find_by_user("nom@site.com")).to eq("user")
			
		end
	end
describe "the Event class" do 
	it "contains the upcoming events" do 
		
	describe "the initialize method of the Event class" do
		it "gives the basic info of the event" do 


				
end

