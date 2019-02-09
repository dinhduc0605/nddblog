$ ->
  $('#images-index').find('button').click ->
    el = $(@).closest('[id*=image-file]').find('#url input')
    el.select()
    document.execCommand('copy')
