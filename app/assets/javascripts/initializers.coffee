# onmount
$(document).on 'turbolinks:load', ->
  $.onmount()

$(document).on 'turbolinks:before-cache', ->
  $.onmount.teardown()

# selectize
# fix
$(document).on 'turbolinks:before-cache', ->
  $('.selectized').each (index, select) ->
    selectedValue = select.selectize.getValue()
    select.selectize.destroy()
    if selectedValue
      $select = $(select)
      $select.find('option').attr('selected', null)
      $select.find("option[value=#{selectedValue}]").attr('selected', true)
