$.onmount '[data-js-qr-code-scanner]', ->

  element = $(@)
  qrCodeMap = element.data 'js-qr-code-map'
  resultElement = $('[data-js-qr-code-scanner-result]')[0]

  openQRCamera = (e) ->
    reader = new FileReader()
    reader.onload = =>
      qrcode.callback = (response) ->
        if response instanceof Error
          alert 'No QR code found. Please try again'
        else
          value = qrCodeMap[response]
          if value?
            resultElement.selectize.setValue value
          else
            alert 'No wallet found'
      qrcode.decode reader.result
    reader.readAsDataURL e.target.files[0]

  element.on 'change', openQRCamera
