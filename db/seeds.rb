class Seed2
  def self.start
    seed = Seed2.new
    seed.create_roles
    seed.create_users
    seed.create_boards
    seed.create_pins
    seed.create_clancey
    seed.pin_to_boards
  end

  def create_roles
    admin = Role.create!(name: "admin")
    puts "Role #{admin.name} created."
    user = Role.create!(name: "user")
    puts "Role #{user.name} created."
  end

  def create_clancey
    clancey = User.create!(
    name: "Clancey",
    email: "clancey007@example.com",
    username:"clancey007",
    phone:"1800000000",
    avatar: "https://upload.wikimedia.org/wikipedia/en/9/93/Tanooki_Mario.jpg",
    password:"password"
    )

    User.find(clancey.id).update(roles:[Role.find_by(name: "admin")])
    puts "Clancey has been created!"
  end

  def create_users
    1000.times do |i|
      user = User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::Number.number(10),
      username: Faker::Internet.password(8),
      avatar: Faker::Avatar.image,
      password: Faker::Internet.password
      )
      puts "#{i}: #{user.name} created."
    end
  end

  def create_boards
    5000.times do |i|
      user = User.find(Random.new.rand(1..1000))
      board = Board.create!(name: Faker::Team.creature, user_id: user.id)
      puts "#{i}: Board #{board.name} created for user #{board.user_id}."
    end
  end

  def create_pins
    200.times do |i|
      board = Board.find(Random.new.rand(1..1000))
      pin = Pin.create!(
        name: Faker::Hipster.word,
        image: Faker::Placeholdit.image("200x200"),
        source: Faker::Internet.url
      )
      puts "#{i}: Pin #{pin.name} created for #{board.name}."
    end
  end

  def pin_to_boards
    20000.times do |i|
      board = Board.find(Random.new.rand(1..5000))
      pin = Pin.find(Random.new.rand(1..200))

      PinBoard.create!(
      board_id: board.id,
      pin_id: pin.id
      )
      puts "#{i}: #{pin.name} pinned to #{board.name}."
    end
  end
end

Seed2.start
