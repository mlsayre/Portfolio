# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create(title: 'Initial Post', content: 'delete this after adding your first post',
  created_at: '20131023203257', published: 'true', creator: 'matt', category: 'test',
  summary: 'test')
