require 'test_helper'

class PeopleIntegrationTest < ActionDispatch::IntegrationTest
  test 'add person' do
    new_name = sample_string
    new_job_title = sample_string
    new_bio = sample_string

    visit '/people'
    assert page.has_content? 'People'
    click_on 'Add New'
    assert page.has_content? 'New'
    fill_in('Name', with: new_name)
    fill_in('Job title', with: new_job_title)
    fill_in('Bio', with: new_bio)
    select('HR', from: 'Department')
    click_on 'Save'
    assert page.has_content? new_name
    assert page.has_content? new_name
    assert page.has_content? new_job_title
    assert page.has_content? new_bio
    assert page.has_content? 'HR'
    click_on 'People'
    assert page.has_content? new_name
  end

  test 'edit person' do
    new_name = sample_string
    new_job_title = sample_string
    new_bio = sample_string

    visit '/people'
    first('li a').click
    assert page.has_content? 'Job Title'
    click_on 'Edit'
    fill_in('Name', with: new_name)
    fill_in('Job title', with: new_job_title)
    fill_in('Bio', with: new_bio)
    click_on 'Save'
    assert page.has_content? new_name
    assert page.has_content? new_job_title
    assert page.has_content? new_bio
    assert page.has_content? "#{new_name} has been updated"
  end

  test 'view all' do
    visit '/people'
    within '#people' do
      assert page.has_content? 'Finance'
      assert page.has_content? 'Support'
    end
  end

  test 'view by department' do
    visit '/people/department/finance'

    within '#people' do
      assert page.has_content? 'Finance'
      refute page.has_content? 'Support'
    end
  end
end
