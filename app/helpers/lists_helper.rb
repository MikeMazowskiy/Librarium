module ListsHelper
  WANT_TO_READ       = "Хочу прочитать".freeze
  READED             = "Прочитал".freeze
  WANT_TO_READ_IMAGE = "https://letidor.ru/thumb/1280x720/smart/filters:quality(75)/imgs/2018/04/24/07/2148932/10a07f44e5278067b11bea002261c3ae310ffc62.jpg".freeze
  READED_IMAGE       = "https://theclassicsclubblog.files.wordpress.com/2018/08/book-the-end-hd-wallpaper.jpg".freeze
  IN_PROGRESS_IMAGE  = "https://i.pinimg.com/280x280_RS/ea/18/5d/ea185de94c4d105b7676397a51f580af.jpg".freeze

  def image(list)
    if list.name == WANT_TO_READ
      WANT_TO_READ_IMAGE
    elsif list.name == READED
      READED_IMAGE
    else
      IN_PROGRESS_IMAGE
    end
  end
end
