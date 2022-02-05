require 'rails_helper'

feature 'layout_links' do 
  scenario 'can link' do
    visit root_path
    expect(page).to have_content('About')

    # Aboutのリンクが機能すること
    
    click_link("Help")
    expect(current_path).to eq help_path
    
    click_link("About")
    expect(current_path).to eq about_path
    
    click_link("Contact")
    expect(current_path).to eq contact_path
    expect(page.title).to eq full_title("Contact")

  
  end
end