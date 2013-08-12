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

  def admins_only(&block) # this method takes a block, which is the code between the "do" and "end" in your view. To
    # run this code inside the method, call block.call, which runs the specified block but only if current_user.try(:admin?)
    # returns a value that evaluates to true. This "try" method tries a method on an object, and if that method doesn't exist
    # (as it wouldn't if current_user were nil), then it returns nil. At the end of the method, you return nil so the content
    # doesn't show again.
    block.call if current_user.try(:admin?)
    nil
  end
end
