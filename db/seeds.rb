# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ministry_list = [
     "Bread from Heaven",
     "Christ's Ambassador of Bread - Cluster 1" ,
     "Armor of God - Cluster 2" ,
     "Tribes of the Lord - Cluster 3" ,
     "Children's Ministry" ,
     "Praise and Worship Ministry" ,
     "Multimedia Ministry" ,
     "Men in Bread" ,
     "Women of Bread" ,
     "Salt and Light" ,
     "Young People's Fellowship" ,
     "Teens Fellowship" ,
     "Kaagapay Ministry" ,
     "Membership"
]

ministry_list.each do |name|
  Ministry.create( name: name )
end

User.create(last_name: "Admin", first_name: "BFHCF", email: "admin@bfhcf.com", password:"password", password_confirmation:"password" )
User.create(last_name: "Castillo", first_name: "Rev. Doy", email: "doy@bfhcf.com", password:"password", password_confirmation:"password" )
