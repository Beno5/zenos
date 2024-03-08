# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(email: 'info@zen-os.com', password: 'Zenos2024')
image_path = Rails.root.join('app', 'assets', 'images', 'team.jpg')
image_path_c1 = Rails.root.join('app', 'assets', 'images', 'first.jpg')
image_path_c2 = Rails.root.join('app', 'assets', 'images', 'druga.jpg')
image_path_c3 = Rails.root.join('app', 'assets', 'images', 'treca.jpg')
image_path_c4 = Rails.root.join('app', 'assets', 'images', 'cetvrta.jpg')

blob = ActiveStorage::Blob.create_and_upload!(io: File.open(image_path), filename: 'team.jpg',
                                              content_type: 'image/jpeg')
blob1 = ActiveStorage::Blob.create_and_upload!(io: File.open(image_path_c1), filename: 'first.jpg',
                                               content_type: 'image/jpeg')
blob2 = ActiveStorage::Blob.create_and_upload!(io: File.open(image_path_c2), filename: 'druga.jpg',
                                               content_type: 'image/jpeg')
blob3 = ActiveStorage::Blob.create_and_upload!(io: File.open(image_path_c3), filename: 'treca.jpg',
                                               content_type: 'image/jpeg')
blob4 = ActiveStorage::Blob.create_and_upload!(io: File.open(image_path_c4), filename: 'cetvrta.jpg',
                                               content_type: 'image/jpeg')

blog_post1 = BlogPost.create!(title: 'Exploring the Future of Technology',
                              description: 'Zenos uses its website, as well as our social media, to spread knowledge about topics of our interest. On our channels, you can find various manuals, trainings, seminars, as well as discussions and resources related to prevailing topics from the business world.')
blog_post1.main_image.attach(blob)
blog_post1.secondary_images.attach(blob1)
blog_post1.secondary_images.attach(blob2)
blog_post1.secondary_images.attach(blob3)
blog_post1.secondary_images.attach(blob4)

blog_post2 = BlogPost.create!(title: 'The Art of Business Growth',
                              description: 'Zenos is everything you need to help you run your business! Make An Appointment Today With Our Online Form')
blog_post2.main_image.attach(blob)

blog_post3 = BlogPost.create!(title: 'Discovering New Horizons',
                              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet massa tellus, vitae lacinia arcu mollis ac. Nulla ex enim, pellente que vitae tristique vel, porttitor in quam. Vestibulum mattis quam gravida malesuada faucibus. Duis nec est ac metuspulvinar nunc commodo nisi orci, sit amet fermentum sapien tempus eu.')
blog_post3.main_image.attach(blob)

blog_post4 = BlogPost.create!(title: 'Innovations in the Digital World',
                              description: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus.')
blog_post4.main_image.attach(blob)

blog_post5 = BlogPost.create!(title: 'Unlocking Creativity in the Workplace',
                              description: 'Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc.')
blog_post5.main_image.attach(blob)

blog_post6 = BlogPost.create!(title: 'This is example title!',
                              description: 'Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.')
blog_post6.main_image.attach(blob)

project_post1 = ProjectPost.create!(title: 'Exploring the Future of Technology',
                                    description: 'Zenos uses its website, as well as our social media, to spread knowledge about topics of our interest. On our channels, you can find various manuals, trainings, seminars, as well as discussions and resources related to prevailing topics from the business world.')
project_post1.main_image.attach(blob)
project_post1.secondary_images.attach(blob1)
project_post1.secondary_images.attach(blob2)
project_post1.secondary_images.attach(blob3)
project_post1.secondary_images.attach(blob4)

project_post2 = ProjectPost.create!(title: 'The Art of Business Growth',
                                    description: 'Zenos is everything you need to help you run your business! Make An Appointment Today With Our Online Form')
project_post2.main_image.attach(blob)

project_post3 = ProjectPost.create!(title: 'Discovering New Horizons',
                                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet massa tellus, vitae lacinia arcu mollis ac. Nulla ex enim, pellente que vitae tristique vel, porttitor in quam. Vestibulum mattis quam gravida malesuada faucibus. Duis nec est ac metuspulvinar nunc commodo nisi orci, sit amet fermentum sapien tempus eu.')
project_post3.main_image.attach(blob)

project_post4 = ProjectPost.create!(title: 'Innovations in the Digital World',
                                    description: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus.')
project_post4.main_image.attach(blob)

project_post5 = ProjectPost.create!(title: 'Unlocking Creativity in the Workplace',
                                    description: 'Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc.')
project_post5.main_image.attach(blob)

project_post6 = ProjectPost.create!(title: 'This is example title!',
                                    description: 'Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.')
project_post6.main_image.attach(blob)
