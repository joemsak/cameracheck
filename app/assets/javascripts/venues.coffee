jQuery ->
  $(document).on('submit', 'form', ->
    $(this).find('input[type=text]').css('background', 'inherit')
    $(this).addClass('loading')
  ).on 'click', '.cancel', (e)->
    e.preventDefault()
    $(this).closest('form')
             .removeClass('active')
             .find("input[type=text]")
             .css('background', 'inherit')
             .attr('readonly', true)
