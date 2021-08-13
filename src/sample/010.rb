class User

end

user = User.new
p user

class User2
  def initialize(user, d)
    p "#{user[:bbb]}"
    p d
  end

  def endless(*c)
    p c[1]
  end
end

a = User2.new({bbb: "ddd", eee: "fff"}, "defs")
a.endless "aaa", "bbb", "ccc"

class User
  def login
    p "こんにちは"
  end
end

user = User.new
user.login

class User
  def initialize
    @user_name = "ゲスト"
  end

  def display_current_user
    p @user_name
  end
end

user = User.new
user.display_current_user

arr = [1, 2, 3, 4, 5]
p arr.map{ |n| n*2 }
