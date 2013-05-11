module SpeaksHelper
  def with_speak_link(str)
    str.gsub(/#(\d+)/) do
      target = Speak.find_by_id($1)
      next $& unless target
      link_to($&, speak_path($1), title: truncate(target.text) )
    end.html_safe
  end
end
