# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string(255)
#  uid              :string(255)
#  name             :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  email            :string(255)
#  image            :string(255)
#  location         :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :image, :location, :name, :oauth_expires_at, :oauth_token, :provider, :uid

  #Method used for omniauth when logging in or creating a new user
  #If user exists he/she is logged in
  #If not the new user is created and the following values are saved in the database
  def self.from_omniauth(auth)
	  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.email = auth.info.email
	    user.image = auth.info.image
	    user.location = auth.info.location
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.save!
		end
	end

end
