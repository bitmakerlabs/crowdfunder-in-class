require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "the index page lists all our projects" do
    # Create a bunch of projects (3) in the DB (using FG)
    p1 = FactoryGirl.create(:project)
    p2 = FactoryGirl.create(:project, title: "Waterproof Whiteboard")
    p3 = FactoryGirl.create(:project, title: "Something else??")

    visit '/projects'
    assert page.has_content?('Projects')

    assert page.has_content?("Wifi-enabled Shoes")
    assert page.has_content?("Waterproof Whiteboard")
    assert page.has_content?("Something else??")

    # Go to the project details (show) page
    click_link 'Waterproof Whiteboard'
    assert_equal project_path(p2), current_path
    assert find('h1:first').has_content? p2.title
  end

  test "pagination" do
    user = FactoryGirl.create :user
    50.times { |i| FactoryGirl.create(:project, title: "Project #{i}", user: user) }

    visit "/projects"

    # Expect the most recently created projects on page 1 (8 PER PAGE)
    assert page.has_content?('Displaying projects 1 - 8 of 50 in total')
    assert page.has_content?('Project 49')
    assert page.has_no_content?('Project 41')
    page.assert_selector 'li.project', count: 8

    # Expect pagination link and click page 2
    page.find('.pagination').click_link '2'
    assert projects_path(page: 2), current_path

    # Expect page 2 to have the next 8 projects
    assert page.has_content?('Project 41')
    assert page.has_no_content?('Project 32')
  end

  test "navigation" do
    visit "/"
    assert_equal root_path, current_path
    # The home nav element should be active
    assert_equal "Home", find("ul.nav li.active a").text

    visit "/projects"
    assert_equal projects_path, current_path
    # The projects nav element should be active
    assert_equal "Projects", find("ul.nav li.active a").text
  end

end
