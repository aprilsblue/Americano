# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener "turbolinks:load", ->
  $('input#email').on 'input', ->
    if $('input#email').val() != ""
      $('input.btn-search').removeAttr('disabled')
    else
      $('input.btn-search').attr('disabled', 'true')
      return
    return
  return
