# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


product_attributes =
  [{
     name: 'Gibson 2015 ES 335 Semi-Hollow Electric Guitar Sunset Burst',
     description: 'A top-flight ES-335 with Burst Bucker pickups, Grover tuners, and traditional looks, all skillfully crafted in the USA. The wood, construction, and headstock pitch all contribute greatly to the tone, aiding this guitars exceptional sustain and depth, and yielding a resonance that can be felt right through the body',
     image_url: '/assets/gibson1.png',
    user_id: 1},
    { name: 'Rickenbacker 620 Electric Guitar Jetglo',
    description: 'The Rickenbacker 620 Electric Guitar offers a lot”graceful body lines; a solid maple body; a sleek, and a fast-playing neck. You also get neck-thru-body construction for greater sustain; precision machined German-made key winds; double truss rods; body and neck binding; triangular markers on its thick rosewood fretboard; dual single-coil pickups that deliver clear, bright tone; and dual jacks for stereo output. The Rickenbacker 620 looks great, feels great, and sounds killer.',
    image_url: '/assets/rickenbacker1.png',
    user_id: 1},
    {
    name: 'Gretsch Guitars G6120T-55 Vintage Select Edition 55 Chet Atkins Hollowbody with Bigsby Vintage Orange Stain',
    description: 'Co-designed with the guitarists guitarist, Chet Atkins, the venerable 6120 is one of the most widely heard Gretsch instruments. The G6120T-55 Vintage Select Edition 55 Chet Atkins hollowbody with Bigsby stays true to the original design and astounding classic aesthetics. A veritable tonal multi-tool, this hollow body has an easy-playing, comfortable feel and rings out proudly with That Great Gretsch Sound',

    user_id: 1
   }]

    product_attributes.each do |attributes|
     product= Product.new(attributes)
     product.save
   end

user_attributes =
[{
   first_name: 'Kresimir',
   last_name: 'Ozbolt',
   email: 'admin@gmail.com',
   role: 'admin',
   password: 'admin1' },
  { first_name: 'John',
    last_name: 'White',
    email: 'john@gmail.com',
    password: 'johnpassword'},
  {
    first_name: 'Amanda',
    last_name: 'Black',
    email: 'amanda@gmail.com',
    password: 'amandapassword'
 }]
 user_attributes.each do |attributes|
  user= User.new(attributes)
  user.save
end

reviews_attributes =
[{
   title: 'I highly recommend this guitar!',
   username: 'Kresimir',
   content: 'This guitar is not your first guitar, its something you long for. The guitar gives you what you want no matter style you play. Its beautiful and your friend forever! BOTTOM LINE Yes, I would recommend this to a friend',
   user_id: 1,
   product_id: 1 },
  { title: 'Fun To Play',
  username: 'Amanda',
  content: 'I ve been playing for almost 50 years and currently own a number of LPs, Strats, etc. I just purchased the 2015 Memphis Block Neck ES335. Having owned 3 different ES 335s over the last dozen years (and having sold each of the prior 3 because they would not stay in tune), Ive finally found an ES that I will use and keep forever. I am an actively gigging musician, playing classic rock and blues. If you ve tried earlier recent models, please note the redesigned neck profile...it is much more slender than before and this totally changes the playability. Tone is awesome and it sound great clean through my Fender Deluxe Reverb as well as with distorion pedals. Fit and finish are perfect and it even came with decent strings that I played for quite awhile before replacing with my personal favorites. If you ve been contemplating buying an ES, the 2015 Memphis may just be the model year to get. Go try one!',
  user_id: 3,
  product_id: 2},
  { title: 'I highly recommend this guitar!',
  username: 'John',
  content: 'This guitar is not your first guitar, its something you long for. The guitar gives you what you want no matter style you play. Its beautiful and your friend forever! BOTTOM LINE Yes, I would recommend this to a friend',
  user_id: 2,
  product_id: 2 },
   { title: 'Fun To Play',
   username: 'Kresimir',
   content: 'I ve been playing for almost 50 years and currently own a number of LPs, Strats, etc. I just purchased the 2015 Memphis Block Neck ES335. Having owned 3 different ES 335s over the last dozen years (and having sold each of the prior 3 because they would not stay in tune), Ive finally found an ES that I will use and keep forever. I am an actively gigging musician, playing classic rock and blues. If you ve tried earlier recent models, please note the redesigned neck profile...it is much more slender than before and this totally changes the playability. Tone is awesome and it sound great clean through my Fender Deluxe Reverb as well as with distorion pedals. Fit and finish are perfect and it even came with decent strings that I played for quite awhile before replacing with my personal favorites. If you ve been contemplating buying an ES, the 2015 Memphis may just be the model year to get. Go try one!',
   user_id: 1,
   product_id: 2},
   { title: 'I highly recommend this guitar!',
   username: 'John',
   content: 'This guitar is not your first guitar, its something you long for. The guitar gives you what you want no matter style you play. Its beautiful and your friend forever! BOTTOM LINE Yes, I would recommend this to a friend',
   user_id: 2,
   product_id: 3 },
  { title: 'Fun To Play',
  username: 'Amanda',
  content: 'I ve been playing for almost 50 years and currently own a number of LPs, Strats, etc. I just purchased the 2015 Memphis Block Neck ES335. Having owned 3 different ES 335s over the last dozen years (and having sold each of the prior 3 because they would not stay in tune), Ive finally found an ES that I will use and keep forever. I am an actively gigging musician, playing classic rock and blues. If you ve tried earlier recent models, please note the redesigned neck profile...it is much more slender than before and this totally changes the playability. Tone is awesome and it sound great clean through my Fender Deluxe Reverb as well as with distorion pedals. Fit and finish are perfect and it even came with decent strings that I played for quite awhile before replacing with my personal favorites. If you ve been contemplating buying an ES, the 2015 Memphis may just be the model year to get. Go try one!',
  user_id: 3,
  product_id: 3}

 ]
 reviews_attributes.each do |attributes|
  review= Review.new(attributes)
  review.save
end

votes_attributes =
  [{
     count: 12,
     voted: false,
     user_id: 1,
     product_id: 1,
     review_id: 1,
    },
    {count: -3,
    voted: false,
    user_id: 2,
    product_id: 1,
    review_id: 2,},
    {count: 15,
    voted: false,
    user_id: 3,
    product_id: 1,
    review_id: 1,},
    {
      count: 7,
      voted: false,
      user_id: 1,
      product_id: 2,
      review_id: 1,
   }]

    votes_attributes.each do |attributes|
     vote= Vote.new(attributes)
     vote.save
   end
