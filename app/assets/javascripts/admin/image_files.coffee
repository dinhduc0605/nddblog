$ ->
  copyToClipboard = (text) ->
    $tmp = $("<input>")
    $('#images-index').append($tmp)
    $tmp.val(text).select()
    document.execCommand('copy')
    $tmp.remove()

  $('[id*=image-file] #copy-url').find('i').click ->
    copyToClipboard($(@).data('url'))
