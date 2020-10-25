feature "Home page has option to add peep or view peeps" do

  scenario "Homepage has an add button" do
    visit('/')
    expect(page).to have_button("Add Peep")
  end

  scenario "Homepage has a view button" do
    visit('/')
    expect(page).to have_button("View Peeps")
  end

  scenario "Add button links to new page" do
    visit('/')
    click_button("Add Peep")
    expect(current_path).to eq("/peeps/new")
  end

  scenario "View button links to new view page" do
    visit('/')
    click_button("View Peeps")
    expect(current_path).to eq("/peeps")
  end
end
