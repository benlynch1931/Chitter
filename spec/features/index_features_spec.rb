feature "User sees option to log in or sign up" do

  scenario "login button links to login path" do
    visit('/')
    expect(page).to have_button('Login')
    click_button("Login")
    expect(current_path).to eq('/authenticate/login')
  end

  scenario "sign up button links to sign up path" do
    visit('/')
    expect(page).to have_button('Sign Up')
    click_button("Sign Up")
    expect(current_path).to eq('/authenticate/signup')
  end
end
