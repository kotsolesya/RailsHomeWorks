# seeds for User
users = [
      { first_name: "John", last_name: 'Batler', username: 'spring', password: 45454545, email: 'some@email1', birthday: '2010-03-29 20:41:38'},
      { first_name: "Mike", last_name: 'Dov', username: 'summer', password: 45454545, email: 'some@email2', birthday: '2000-03-29 20:41:38'},
      { first_name: "Kit", last_name: 'McMarty', username: 'winter', password: 45454545, email: 'some@email3', birthday: '1997-03-29 20:41:38'}
    ]
 users.each do |u|
   User.create u
 end

# seeds for Post
posts = [
      { title: 'Hello spring', body: 'best day on the year', published_at: '2017-03-29 20:41:38'},
      { title: 'Hello summer', body: 'best day on the year', published_at: '2017-03-28 20:41:38'},
      { title: 'Hello winter', body: 'best day on the year', published_at: '2017-03-27 20:41:38'}
    ]
 posts.each do |ps|
   Post.create ps
 end

# seeds for Images
images = [
      { url: 'http://cdn1-www.cattime.com/assets/uploads/gallery/persian-cats-and-kittens/persian-cats-and-kittens-1.jpg'},
      { url: 'https://s-media-cache-ak0.pinimg.com/originals/75/3c/a4/753ca4c3c54413ce0c9ea9f7f5449183.jpg'},
      { url: 'http://cdn2-www.cattime.com/assets/uploads/gallery/persian-cats-and-kittens/persian-cats-and-kittens-10.jpg'}
    ]
 images.each do |i|
   Image.create i
 end
