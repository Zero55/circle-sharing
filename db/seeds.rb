user = User.new(
      :first_name            => "Earl",
      :last_name             => "Earth",
      :email                 => "test@mail.com",
      :password              => "Password2134",
      :password_confirmation => "Password2134"
  )
  user.skip_confirmation!
  user.save!

user2 = User.new(
      :first_name            => "Suzie",
      :last_name             => "Saturn",
      :email                 => "test2@mail.com",
      :password              => "Password2134",
      :password_confirmation => "Password2134"
  )
  user.skip_confirmation!
  user.save!

user3 = User.new(
      :first_name            => "Michael",
      :last_name             => "Mars",
      :email                 => "test3@mail.com",
      :password              => "Password2134",
      :password_confirmation => "Password2134"
  )
  user.skip_confirmation!
  user.save!

user4 = User.new(
      :first_name            => "Lauren",
      :last_name             => "Luna",
      :email                 => "test4@mail.com",
      :password              => "Password2134",
      :password_confirmation => "Password2134"
  )
  user.skip_confirmation!
  user.save!

user5 = User.new(
      :first_name            => "Vanessa",
      :last_name             => "Venus",
      :email                 => "test5@mail.com",
      :password              => "Password2134",
      :password_confirmation => "Password2134"
  )
  user.skip_confirmation!
  user.save!
