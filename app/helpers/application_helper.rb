module ApplicationHelper
  # As reminder: a helper are for extracting the logic from the views, as views should just be about displaying information.
  # this helper method will help for a general title tag in the head tag. This is a method (*) this means that everything
  # pass as an array for that method.

  def title(*parts)
    unless parts.empty? # this means that if that array if not empty.
      content_for :title do # go for the title object which is the :title for the head tag specified on the application.html.erb file
        (parts << "Ticketee").join(" - ") unless parts.empty? # looping to appending the strings on the array to the "ticketee" joining
      end                                                     # by a "-".
    end
  end
end
