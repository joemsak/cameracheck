jQuery ->
  $('form').submit ->
    $(this).find('input').css('background', 'inherit')
    $(this).addClass('loading')

  $('.cancel').click (e)->
    e.preventDefault()
    $(this).closest('form')
             .removeClass('active')
             .find('input')
             .attr('readonly', true)
