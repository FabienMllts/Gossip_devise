require 'rails_helper'

RSpec.describe "devise/registrations/new/html.erb", type: :request do
	it 'You cannot subscribe without code' do
  	post '/users', params: {username: "test", email: "test@gmail.com", password: "123456", sign_up_code:""}
		expect(response.body).to include("Sign up code is not included in the list")
  end

  it 'You can subscribe with the right code' do
  	post '/users', params: {username: "coucou", email: "coucou@gmail.com", password: "coucou", sign_up_code:"THP2018"}
  	expect(response).to have_http_status(200)
  end

#  it 'redirects subscribed member to index' do
#  	post '/users', params: {username: "test", email: "test@gmail.com", password: "123456", sign_up_code:"THP2018"}
# 		expect(response.location).to eq(root_path)

#		expect(response).to redirect_to root_path
#  end
end