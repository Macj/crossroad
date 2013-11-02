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
Category.create(:name => 'Литература', :parent_id => 1)
Category.create(:name => 'Искусство', :parent_id => 1)
Category.create(:name => 'Музыка', :parent_id => 1)
Category.create(:name => 'Танец', :parent_id => 1)
Category.create(:name => 'Кино', :parent_id => 1)
Category.create(:name => 'Деятельность', :parent_id => 1)

Type.create(:name => "Выставка")
Type.create(:name => "Выступление")
Type.create(:name => "Концерт")
Type.create(:name => "Квартирник")
Type.create(:name => "Мероприятие")
Type.create(:name => "Примьера")
Type.create(:name => "Фестиваль")
Type.create(:name => "Ярмарка")

Article.create( :name => "arty", :category_id => 2, :autor_id => nil,:body => "Test body for test article", :sources => 'test.article.dp.ua',  :autor =>  'Crossroad', :type_id =>1)
Article.create( :name => "arty2", :category_id => 3, :autor_id => nil, :body => "Test body for test article2", :sources => 'test.article2.dp.ua',  :autor => 'Crossroad', :type_id => 1)
Article.create( :name => "Статья3", :category_id => 4, :autor_id => nil, :body => "Test body for test article3", :sources => 'test.article3.dp.ua',  :autor => 'Crossroad', :type_id => 2)
Article.create( :name => "Статья4", :category_id => 5, :autor_id => nil, :body => "Test body for test article4", :sources => 'test.article4.dp.ua',  :autor => 'Crossroad', :type_id => 2)

Event.create(category_id: 2, type_id: 1,  name: 'Собтие', begin_date: Time.now, end_date: Time.now + 1.day, description: "Событие себе из категории #{Category.find(2).name} типа #{Type.find(1).name}", web_links: "event_link.dp.ua")
Event.create(category_id: 2, type_id: 1,  name: 'Собтие1', begin_date: Time.now, end_date: Time.now + 1.day, description: "Событие себе из категории #{Category.find(2).name} типа #{Type.find(1).name}", web_links: "event_link.dp.ua")
Event.create(category_id: 3, type_id: 2,  name: 'Собтие2', begin_date: Time.now, end_date: Time.now + 1.day, description: "Событие себе из категории #{Category.find(3).name} типа #{Type.find(2).name}", web_links: "event_link.dp.ua")
Event.create(category_id: 3, type_id: 2,  name: 'Собтие3', begin_date: Time.now, end_date: Time.now + 1.day, description: "Событие себе из категории #{Category.find(3).name} типа #{Type.find(2).name}", web_links: "event_link.dp.ua")
Event.create(category_id: 4, type_id: 3,  name: 'Собтие4', begin_date: Time.now, end_date: Time.now + 1.day, description: "Событие себе из категории #{Category.find(4).name} типа #{Type.find(3).name}", web_links: "event_link.dp.ua")
Event.create(category_id: 4, type_id: 4,  name: 'Собтие5', begin_date: Time.now, end_date: Time.now + 1.day, description: "Событие себе из категории #{Category.find(4).name} типа #{Type.find(4).name}", web_links: "event_link.dp.ua")
Event.create(category_id: 5, type_id: 5,  name: 'Собтие6', begin_date: Time.now, end_date: Time.now + 1.day, description: "Событие себе из категории #{Category.find(5).name} типа #{Type.find(5).name}", web_links: "event_link.dp.ua")
Event.create(category_id: 5, type_id: 6,  name: 'Собтие7', begin_date: Time.now, end_date: Time.now + 1.day, description: "Событие себе из категории #{Category.find(5).name} типа #{Type.find(6).name}", web_links: "event_link.dp.ua")
Event.create(category_id: 6, type_id: 7,  name: 'Собтие8', begin_date: Time.now, end_date: Time.now + 1.day, description: "Событие себе из категории #{Category.find(6).name} типа #{Type.find(7).name}", web_links: "event_link.dp.ua")
Event.create(category_id: 7, type_id: 8,  name: 'Собтие9', begin_date: Time.now, end_date: Time.now + 1.day, description: "Событие себе из категории #{Category.find(7).name} типа #{Type.find(8).name}", web_links: "event_link.dp.ua")


Place.create(name: 'Тестовое место', category_id: 2, type_id: 1,  description: "Мысто себе из категории #{Category.find(2).name} типа #{Type.find(1).name}", web_links: "place.dp.ua", :address_id => 1)
Place.create(name: 'Тестовое место', category_id: 3, type_id: 2,  description: "Мысто себе из категории #{Category.find(3).name} типа #{Type.find(2).name}", web_links: "place.dp.ua", :address_id => 2)
Place.create(name: 'Тестовое место', category_id: 4, type_id: 3,  description: "Мысто себе из категории #{Category.find(4).name} типа #{Type.find(3).name}", web_links: "place.dp.ua", :address_id => 3)
Place.create(name: 'Тестовое место', category_id: 5, type_id: 4,  description: "Мысто себе из категории #{Category.find(5).name} типа #{Type.find(4).name}", web_links: "place.dp.ua", :address_id => 4)
Place.create(name: 'Тестовое место', category_id: 6, type_id: 5,  description: "Мысто себе из категории #{Category.find(6).name} типа #{Type.find(5).name}", web_links: "place.dp.ua", :address_id => 5)
Place.create(name: 'Тестовое место', category_id: 7, type_id: 6,  description: "Мысто себе из категории #{Category.find(7).name} типа #{Type.find(6).name}", web_links: "place.dp.ua", :address_id => 6)
Place.create(name: 'Тестовое место', category_id: 8, type_id: 7,  description: "Мысто себе из категории #{Category.find(8).name} типа #{Type.find(7).name}", web_links: "place.dp.ua", :address_id => 7)

Project.create( name: "Проект", category_id: 2, type_id: 1,  description: "Проект себе такой из категории #{Category.find(2).name} типа #{Type.find(1).name}", web_links: "project.dp.ua")
Project.create( name: "Проект2", category_id: 2, type_id: 1,  description: "Проект себе такой из категории #{Category.find(2).name} типа #{Type.find(1).name}", web_links: "project.dp.ua")
Project.create( name: "Проект3", category_id: 3, type_id: 2,  description: "Проект себе такой из категории #{Category.find(3).name} типа #{Type.find(2).name}", web_links: "project.dp.ua")
Project.create( name: "Проект4", category_id: 4, type_id: 3,  description: "Проект себе такой из категории #{Category.find(4).name} типа #{Type.find(3).name}", web_links: "project.dp.ua")
Project.create( name: "Проект5", category_id: 5, type_id: 4,  description: "Проект себе такой из категории #{Category.find(5).name} типа #{Type.find(4).name}", web_links: "project.dp.ua")
Project.create( name: "Проект6", category_id: 6, type_id: 5,  description: "Проект себе такой из категории #{Category.find(6).name} типа #{Type.find(5).name}", web_links: "project.dp.ua")
Project.create( name: "Проект7", category_id: 7, type_id: 6,  description: "Проект себе такой из категории #{Category.find(7).name} типа #{Type.find(6).name}", web_links: "project.dp.ua")
Project.create( name: "Проект8", category_id: 8, type_id: 7,  description: "Проект себе такой из категории #{Category.find(8).name} типа #{Type.find(7).name}", web_links: "project.dp.ua")

Address.create(:building => '50A', :city => 'Днепропетровск', :street => 'Совхозная')
Address.create(:building => '50', :city => 'Днепропетровск', :street => 'Совхозная')
Address.create(:building => '52', :city => 'Днепропетровск', :street => 'Совхозная')
Address.create(:building => '48', :city => 'Днепропетровск', :street => 'Совхозная')
Address.create(:building => '46', :city => 'Днепропетровск', :street => 'Совхозная')
Address.create(:building => '44', :city => 'Днепропетровск', :street => 'Совхозная')
Address.create(:building => '42', :city => 'Днепропетровск', :street => 'Совхозная')
Address.create(:building => '40', :city => 'Днепропетровск', :street => 'Совхозная')


