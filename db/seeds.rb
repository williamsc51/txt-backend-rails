# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(fname: 'Courtney', lname: 'Williams', email: 'courtney@txt.com', password: 'courtney')
User.create(fname: 'Karl', lname: 'Williams', email: 'karl@txt.com', password: 'williams')
User.create(fname: 'Admin', lname: 'User', email: 'admin@txt.com', password: 'passsword')
User.create(fname: 'Pro', lname: 'User', email: 'pro@txt.com', password: 'passsword')

book1 = Book.create(title: 'Hamlet', author: 'William Shakespeare', isbn: 9781355554073, price: 19.99, description: 'The Tragedy of Hamlet, Prince of Denmark, often shortened to Hamlet, is a tragedy written by William Shakespeare at an uncertain date between 1599 and 1602.', condition: 'poor', category: 'novel', user_id: 1)
book1.image.attach(io: File.open('public/uploads/book/hamlet.png'), filename: 'hamlet.png')

book2 = Book.create(title: 'Cat in the Hat', author: 'Dr. Seuss', isbn: 9782371000193, price: 7.99, description: 'He may be an old standby, but he never lets us down. When in doubt, turn to the story of the cat that transformed a dull, rainy afternoon into a magical moment', condition: 'good', category: 'kids', user_id: 2)
book2.image.attach(io: File.open('public/uploads/book/catinthehat.png'), filename: 'catinthehat.png')

book3 = Book.create(title: 'Small Great Things', author: 'Jodi Picoult', isbn: 9781525231476, price: 14.99, description: "With incredible empathy, intelligence, and candor, Jodi Picoult tackles race, privilege, prejudice, justice, and compassion—and doesn't offer easy answers.", condition: 'great', category: 'college', user_id: 3)
book3.image.attach(io: File.open('public/uploads/book/smallgreatethings.png'), filename: 'smallgreatethings.png')

book4 = Book.create(title: 'Fifty Shades of Grey', author: 'E. L. James', isbn: 9789113071381, price: 9.95, description: "Fifty Shades of Grey is a 2011 erotic romance novel by British author E. L. James. It became the first instalment in the Fifty Shades novel series that traces the deepening relationship between a college graduate, Anastasia Steele, and a young business magnate, Christian Grey.", condition: 'average', category: 'novel', user_id: 4)
book4.image.attach(io: File.open('public/uploads/book/fiftyshadesofgrey.png'), filename: 'fiftyshadesofgrey.png')

book5 = Book.create(title: 'Fifty Shades Darker', author: 'E. L. James', isbn: 9781525231333, price: 12.95, description: "With incredible empathy, intelligence, and candor, Jodi Picoult tackles race, privilege, prejudice, justice, and compassion—and doesn't offer easy answers.", condition: 'great', category: 'novel', user_id: 4)
book5.image.attach(io: File.open('public/uploads/book/fiftyshadesdarker.png'), filename: 'fiftyshadesdarker.png')

book6 = Book.create(title: 'Beppo', author: 'K. Rodney', isbn: 9781525231000, price: 2.95, description: "An old book about a little boy journey thorugh poverty with his grandfather", condition: 'great', category: 'high school', user_id: 2)
book6.image.attach(io: File.open('public/uploads/book/beppo.png'), filename: 'beppo.png')
