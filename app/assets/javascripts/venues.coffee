jQuery ->
  $('form').submit ->
    $(this).find('input').css('background', 'inherit')
    $(this).addClass('loading')
