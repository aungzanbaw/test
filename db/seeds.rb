# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.delete_all
@customer = Customer.create!(name:"Kyaw Kyaw", phone:909090909, password:"123123", city:"Yangon", address: "no 1 aka str, ABC township")
@customer1 = Customer.create!(name:"Aye Aye", phone:943105273, password:"123123", city:"Yangon", address: "no 123 aka str, YUI township")
@customer2 = Customer.create!(name:"Maung Maung", phone:9323716728, password:"123123", city:"Yangon", address: "no 909 lol str, XYZ township")
@customer3 = Customer.create!(name:"John Doe", phone:123123, password:"123123", city:"Yangon", address: "no 909 lol str, XYZ township")
@customer4 = Customer.create!(name:"William", phone:983819, password:"123123", city:"Yangon", address: "no 909 lol str, XYZ township")

Department.delete_all
@dep0 = Department.create!(name:"Admin", description:"Above all departments")
@dep = Department.create!(name:"Clock", description:"a small timepiece worn typically on a strap on one's wrist")
@dep1 = Department.create!(name:"Handset", description:"a cellular phone that performs many of the functions of a computer")
@dep2 = Department.create!(name:"Electronic", description:"carried out or accessed by means of a computer or other electronic device")
@dep3 = Department.create!(name:"Handset Accessories", description:"this is a demo text, replace with something")
@dep4 = Department.create!(name:"CCTV & PABX", description:"this is a demo text, replace with something")

Staff.delete_all
@staff0 = Staff.create!(username:"Thet Naing", password:"123123", department:@dep0)
@staff = Staff.create!(username:"Kyaw Kyaw", password:"123123", department:@dep)
@staff1 = Staff.create!(username:"Aye Aye", password:"123123", department:@dep1)
@staff2 = Staff.create!(username:"Maung Maung", password:"123123", department:@dep2)
@staff3 = Staff.create!(username:"Thet Thet", password:"123123", department:@dep3)
@staff4 = Staff.create!(username:"Htet Htet", password:"123123", department:@dep4)

Product.delete_all
@p = Product.create!(name:"AAA", brand:"AAA", group:"aa group", price:12300, department:@dep)
@p1 = Product.create!(name:"BBB", brand:"BBB", group:"bb group", price:323, department:@dep)
@p2 = Product.create!(name:"CCC", brand:"CCC", group:"cc group", price:4344, department:@dep1)
@p3 = Product.create!(name:"DDD", brand:"DDD", group:"dd group", price:86776, department:@dep1)
@p4 = Product.create!(name:"EEE", brand:"EEE", group:"ee group", price:8462, department:@dep2)
@p5 = Product.create!(name:"FFF", brand:"FFF", group:"ff group", price:93737, department:@dep2)
@p6 = Product.create!(name:"GGG", brand:"GGG", group:"gg group", price:123, department:@dep3)
@p7 = Product.create!(name:"HHH", brand:"HHH", group:"hh group", price:456, department:@dep3)
@p8 = Product.create!(name:"III", brand:"III", group:"ii group", price:123, department:@dep4)
@p9 = Product.create!(name:"JJJ", brand:"JJJ", group:"jj group", price:456, department:@dep4)

Order.delete_all
@o = Order.create!(customer:@customer, delivery:"Car", gate:"Mandalar Min", remark:"" , payment:"cash", status: true, department:@dep)
@o1 = Order.create!(customer:@customer1, delivery:"Plane", gate:"Mandalar Min", remark:"" , payment:"credit", status: true, department:@dep1)
@o2 = Order.create!(customer:@customer2, delivery:"Ship", gate:"Mandalar Min", remark:"" , payment:"cash", status: false, department:@dep2)
@o3 = Order.create!(customer:@customer3, delivery:"Air", gate:"Mandalar Min", remark:"" , payment:"cash", status: false, department:@dep3)
@o4 = Order.create!(customer:@customer4, delivery:"Train", gate:"Mandalar Min", remark:"" , payment:"cash", status: false, department:@dep4)
@o5 = Order.create!(customer:@customer1, delivery:"Plane", gate:"Mandalar Min", remark:"" , payment:"credit", status: false, department:@dep1)

Detail.delete_all
Detail.create!(order:@o,name: "test", qty:1, price: 1)
Detail.create!(order:@o,name: "test",  qty:2, price: 2)
Detail.create!(order:@o,name: "test",  qty:3, price: 3)
Detail.create!(order:@o1,name: "test",  qty:4, price: 4)
Detail.create!(order:@o1,name: "test",  qty:5, price: 5)
Detail.create!(order:@o1,name: "test",  qty:6, price: 6)
Detail.create!(order:@o2,name: "test",  qty:7, price:7)
Detail.create!(order:@o2,name: "test",  qty:8, price: 8)
Detail.create!(order:@o2,name: "test",  qty:9, price: 9)
Detail.create!(order:@o2,name: "test",  qty:10, price: 10)
Detail.create!(order:@o3,name: "test",  qty:21, price: 11)
Detail.create!(order:@o3,name: "test",  qty:12, price: 12)
Detail.create!(order:@o4,name: "test",  qty:1, price: 13)
Detail.create!(order:@o4,name: "test",  qty:12, price: 14)
Detail.create!(order:@o5,name: "test",  qty:12, price: 15)
Detail.create!(order:@o5,name: "test",  qty:12, price: 16)
