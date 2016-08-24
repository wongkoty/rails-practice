require 'rails_helper'

# RSpec.describe "StaticPages", type: :request do
#   describe "GET /static_pages" do
#     it "works! (now write some real specs)" do
#       get static_pages_index_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end
# require 'spec helper' describe "Static pages" do
# describe "Home page" do
# it "should have the content 'Sample App'" do visit '/static pages/home'
# page.should have content('Sample App')
# end end
# end

require 'spec_helper' 

describe "User pages" do
  subject { page }

	describe "signup page" do 
		before { visit signup_path }

		it { should have_selector('title', text: full_title('Sign up')) }
		it { should have_selector('h1', text: 'Sign up') }
	end
 end
