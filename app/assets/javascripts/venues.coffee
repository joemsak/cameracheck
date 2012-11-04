jQuery ->
  $(document).on('submit', 'form', ->
    $(this).find('input').css('background', 'inherit')
    $(this).addClass('loading')
  ).on 'click', '.cancel', (e)->
    e.preventDefault()
    $(this).closest('form')
             .removeClass('active')
             .find('input')
             .css('background', 'inherit')
             .attr('readonly', true)
