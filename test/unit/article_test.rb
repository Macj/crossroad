require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # relations
  test "has references with Place" do
    place = Place.create(:name => 'Test Place1', :category_id => 1, :type_id => 1, :address_id => 1)
    article = Article.create(:category_id => 1, :autor_id => 1)
    article.places << place
    assert article.places.include?(place)
  end

  test "has references with Project" do
    proj = Project.create(:name => 'Test Proj1', :category_id => 1, :type_id => 1)
    article = Article.create(:category_id => 1, :autor_id => 1)
    article.projects << proj
    assert article.projects.include?(proj)
  end

  test "has references with People" do
    person = Person.create(:fio => 'Max')
    article = Article.create(:category_id => 1, :autor_id => 1)
    article.people << person
    assert article.people.include?(person)
  end

  test "has references with Events" do
    event = Event.create(:name => 'Test Event1', :category_id => 1, :type_id => 1, :place_id => 1)
    article = Article.create(:category_id => 1, :autor_id => 1)
    article.events << event
    assert article.events.include?(event)
  end

  # validations 

  
end
