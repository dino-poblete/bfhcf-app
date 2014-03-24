module UsersHelper

  def show_avatar(object)
    if User.find_by_id(object.user_id).avatar.blank?
    image_tag "people/default.jpg", alt: "No Avatar Yet"
    else
      image_tag User.find_by_id(object.user_id).avatar.url(:standard), alt: "No Avatar Yet"
    end
  end

  def show_user_avatar(object)
    if object.avatar.blank?
      image_tag "people/default.jpg", alt: "No Avatar Yet"
    else
      image_tag object.avatar.url(:standard), alt: "No Avatar Yet"
    end
  end

  def show_user_avatar_small(object)
    if object.avatar.blank?
      image_tag "people/default.jpg", width: "50px", alt: "No Avatar Yet"
    else
      image_tag object.avatar.url(:small), alt: "No Avatar Yet"
    end
  end
end
