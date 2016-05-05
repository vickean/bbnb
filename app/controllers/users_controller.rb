class UsersController < Clearance::UsersController
  private
  def user_from_params
    user_params = params[:user] || Hash.new
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    firstname = user_params.delete(:firstname)
    lastname = user_params.delete(:lastname)
    birthday = [user_params.delete("birthday(1i)"), user_params.delete("birthday(2i)"), user_params.delete("birthday(3i)")].join(".")
    phonenumber = user_params.delete(:phonenumber)
    description = user_params.delete(:description)
    country = user_params.delete(:country)
    gender = user_params.delete(:gender)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.firstname  = firstname
      user.lastname = lastname
      user.birthday = birthday
      user.phonenumber = phonenumber
      user.description = description
      user.country = country
      user.gender = gender
    end
  end

  def permit_params
    params.require(:user).permit(:email, :password, :firstname, :lastname, :phonenumber, :description, :country, :gender, "birthday(1i)", "birthday(2i)", "birthday(3i)")
  end
end
