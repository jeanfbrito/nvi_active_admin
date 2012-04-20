jQuery ->
  url = document.location.toString()
  if (url.match('#'))
    $('.nav-tabs a[href=#'+url.split('#')[1]+']').tab('show')

  # Change hash for page-reload
  # $('.nav-tabs a').on 'shown', (e) ->
  #   window.location.hash = e.target.hash