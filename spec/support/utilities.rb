
# It checks the title method as well
def full_title(page_title)
  base_title="Combining Project page"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end
