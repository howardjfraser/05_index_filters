require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
    @person = people(:david)
  end

  test 'valid' do
    assert @person.valid?
  end

  test 'name is required' do
    @person.name = nil
    refute @person.valid?
  end

  test 'name should be 48 chars or less' do
    @person.name = 'a' * 48
    assert @person.valid?
    @person.name = 'a' * 49
    refute @person.valid?
  end

  test 'job_title is required' do
    @person.job_title = nil
    refute @person.valid?
  end

  test 'job_title should be 48 chars or less' do
    @person.job_title = 'a' * 48
    assert @person.valid?
    @person.job_title = 'a' * 49
    refute @person.valid?
  end

  test 'bio is required' do
    @person.bio = nil
    refute @person.valid?
  end

  test 'bio should be 512 chars or less' do
    @person.bio = 'a' * 512
    assert @person.valid?
    @person.bio = 'a' * 513
    refute @person.valid?
  end

  test 'department should be in list' do
    @person.department = nil
    refute @person.valid?
    @person.department = 'unknown'
    refute @person.valid?
  end

  test 'department scope' do
    people = Person.department 'finance'
    people.each do |p|
      assert p.department = 'Finance'
    end
  end

  test 'first name' do
    assert @person.name == 'David Jones'
    assert @person.first_name == 'David'
    @person.name = 'Keith'
    assert @person.first_name == 'Keith'
  end
end
