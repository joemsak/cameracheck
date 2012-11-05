jQuery ->
  $(document).on('submit', 'form', ->
    $(this).find('input[type=text]').css('background', 'inherit')
    $(this).addClass('loading')

  ).on('click', '.cancel', (e)->
    e.preventDefault()
    $(this).parent()
             .removeClass('active')
             .find("input").not('[type=submit]')
             .css('background', 'inherit')
             .attr('readonly', true)
             .attr('disabled', true)

  ).on('click', 'form .remove_fields', (event) ->
    $(this).closest('fieldset').hide()
             .find('input[type=text]').val('')
    event.preventDefault()

  ).on 'click', 'form .add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

