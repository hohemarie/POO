require_relative '../lib/user'

describe User do 

	before(:each) do
	
	
		Object.send(:remove_const, 'User')
		load 'user.rb'
	end
	describe 'initializer' do 
	
		it 'creates an user' do
			user = User.new("email@email.com")
			expect(user.class).to eq(User)
		end
	end
end

