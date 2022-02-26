require 'rails_helper'

RSpec.feature "UsersIndex", type: :feature do
  let(:user) { FactoryBot.create(:user8)}
  scenario "index including pagination" do
    log_in_as user
    visit users_path
    User.paginate(page: 1).each do |u|
      expect(page).to have_link u.name
    end
    
  end
end
