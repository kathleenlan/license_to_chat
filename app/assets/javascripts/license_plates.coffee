# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.LicensePlates = do ->
  dataLinkToSelector = '[data-link-to]'

  initialize = ->
    bindEvents()

  bindEvents = ->
    bindLicensePlateRowClickEvent()

  bindLicensePlateRowClickEvent = ->
    $(dataLinkToSelector).on 'click', (event) ->
      $clickedLicensePlate = $(event.currentTarget)
      url = $clickedLicensePlate.data('link-to')
      window.location.replace(url)

  initialize: initialize

$ ->
  if $('[data-container="license-plates"]').size() > 0
    window.LicensePlates.initialize()
