jQuery ->
  $('form').submit ->
    $(this).find('input').css('background', 'inherit')
    $(this).addClass('loading')

  $(document).on 'click', '.cancel', (e)->
    e.preventDefault()
    $(this).closest('form')
             .removeClass('active')
             .find('input')
             .attr('readonly', true)
