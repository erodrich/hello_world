module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.correo.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.nombre, class: "gravatar")
  end

end
