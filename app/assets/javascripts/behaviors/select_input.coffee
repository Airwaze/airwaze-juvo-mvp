$.onmount '[data-js-select-input]', ->

  element = $(@)
  options = {}

  if element.data 'js-select-input-createable'
    options =
      create: true
      createOnBlur: true
      persist: false

  element.selectize options
