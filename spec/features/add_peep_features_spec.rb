feature "Allows user to add a new peep" do

  scenario "Input field for user's peep body" do
    visit('/peeps/new')
    expect(page).to have_field("peep-body")
  end

  scenario "Submit button to add user's peep" do
    visit('/peeps/new')
    expect(page).to have_button("Add Peep")
  end
end
