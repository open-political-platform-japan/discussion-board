module SpeaksHelper
  def vote_icon(speak)
    return unless can? :vote, speak
    if current_user.liked? speak
      link_to glyph(:thumbs_up, :active), vote_speak_path(speak, cancel: true), method: :post
    else
      link_to glyph(:thumbs_up), vote_speak_path(speak), method: :post
    end
  end
  def with_speak_link(str)
    str.gsub(/#(\d+)/) do
      target = Speak.find_by_id($1)
      next $& unless target
      link_to($&, speak_path($1), title: truncate(target.text) )
    end.html_safe
  end
end
