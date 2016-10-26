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
     description: 'A top-flight ES-335 with Burst Bucker pickups, Grover tuners, and traditional looks, all skillfully crafted in the USA.',
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
