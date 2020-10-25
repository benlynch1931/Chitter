feature "page displays all peeps in reverse-chronological order" do

  scenario "clicking view button displays peeps" do
    truncate_table
    populate_table
    visit('/peeps')
    expect(page).to have_content("Third Peep!")
    expect(page).to have_content("2020-10-24 - 12:30:02")
    expect(page).to have_content("Second Peep!")
    expect(page).to have_content("2020-10-24 - 11:13:39")
    expect(page).to have_content("First Peep!")
    expect(page).to have_content("2020-10-24 - 10:45:20")
  end
end
