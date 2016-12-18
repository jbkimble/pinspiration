class Seed

  def self.start
    seed = Seed.new
    seed.create_roles
    seed.create_users
    seed.create_boards
    seed.create_pins
  end

  def create_roles
    admin = Role.create!(name: "admin")
    puts "Role #{admin.name} created."
    user = Role.create!(name: "user")
    puts "Role #{user.name} created."
  end

  def create_users
    10.times do |i|
      user = User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::Number.number(10),
      username: Faker::Internet.user_name,
      avatar: Faker::Avatar.image,
      password: Faker::Internet.password
      )
      puts "#{i}: #{user.name} created."
    end
  end

  def create_boards
    100.times do |i|
      user = User.find(Random.new.rand(1..10))
      board = Board.create!(name: Faker::Team.creature, user_id: user.id)
      puts "#{i}: Board #{board.name} created for user #{board.user_id}."
    end
  end

  def create_pins
    200.times do |i|
      board = Board.find(Random.new.rand(1..100))
      pin = Pin.create!(
        name: Faker::Hipster.word,
        image: Faker::Placeholdit.image,
        source: Faker::Internet.url
      )
      puts "#{i}: Pin #{pin.name} created for #{board.name}."
    end
  end
end

Seed.start
