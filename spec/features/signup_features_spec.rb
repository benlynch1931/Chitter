feature "User can sign up with their name, email, username and password" do

  scenario "inputs exist for the above keys" do
    visit('/')
    click_button('Sign Up')
    expect(page).to have_field('name')
    expect(page).to have_field('username')
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_button("Sign Up")
  end

  scenario "once signed up, user can see options to create peeps or see all peeps" do
    visit('/')
    click_button('Sign Up')
    fill_in('name', with: 'Ben')
    fill_in('username', with: 'benlynch')
    fill_in('email', with: 'ben@example.co.uk')
    fill_in('password', with: 'BenIsAwesome99')
    click_button("Sign Up")
    expect(current_path).to eq('/peeps/options')
  end
end
