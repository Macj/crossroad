# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(:name => 'Культура')
Category.create(:name => 'Театр', :parent_id => 1)
Category.create(:name => 'Кино', :parent_id => 1)
Category.create(:name => 'Музыка', :parent_id => 1)

Type.create(:name => 'test article type')
Article.create( :name => "Test", :category_id => 2, :autor_id => nil,:body => "Test body for test article", :sources => 'test.article.dp.ua',  :autor =>  'Crossroad', :type_id =>1)
Article.create( :name => "Test2", :category_id => 2, :autor_id => nil, :body => "Test body for test article2", :sources => 'test.article2.dp.ua',  :autor => 'Crossroad', :type_id => 1)
Article.create( :name => "Test3", :category_id => 2, :autor_id => nil, :body => "Test body for test article3", :sources => 'test.article3.dp.ua',  :autor => 'Crossroad', :type_id => 1)
Article.create( :name => "Test4", :category_id => 2, :autor_id => nil, :body => "Test body for test article4", :sources => 'test.article4.dp.ua',  :autor => 'Crossroad', :type_id => 1)


