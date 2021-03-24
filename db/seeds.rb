connection = ActiveRecord::Base.connection()
connection.execute('ALTER SEQUENCE categories_id_seq RESTART WITH 1')
connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
connection.execute('ALTER SEQUENCE articles_id_seq RESTART WITH 1')
connection.execute('ALTER SEQUENCE votes_id_seq RESTART WITH 1')

User.create(name: 'Admin', email: 'admin@admin.com', password: '123456')

Category.create(name: 'Business', priority: 1)
Category.create(name: 'Sports', priority: 2)
Category.create(name: 'Fashion', priority: 3)
Category.create(name: 'Entertainment', priority: 4)

Article.create(title: 'Article generate for business', content: 'Content for article',
               user_id: 1, image_url: 'https://iescamp.com.br/wp-content/uploads/2020/01/https___blogs-images.forbes.com_alejandrocremades_files_2018_12_business-3605367_1920-1200x741-1.jpg',
               category_id: 1)
Article.create(title: 'Article generate for sports', content: 'Content for article',
               user_id: 1, image_url: 'https://wfmj.images.worldnow.com/images/18627951_G.jpg',
               category_id: 2)
Article.create(title: 'Article generate for fashion', content: 'Content for article',
               user_id: 1, image_url: 'https://thestore-berlin.com/wp-content/uploads/2020/01/vegan-plant-based-news-vegan-fashion-week-livekindly.jpg',
               category_id: 3)
Article.create(title: 'Article generate for entertainment', content: 'Content for article',
               user_id: 1, image_url: 'https://analyticsinsight.b-cdn.net/wp-content/uploads/2019/02/Media-and-Entertainment.jpg',
               category_id: 4)

Vote.create(user_id: 1, article_id: 1)

