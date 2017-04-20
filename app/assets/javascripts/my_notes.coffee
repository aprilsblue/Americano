# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener "turbolinks:load", ->
  $("body").on "mouseover", ".mynote-content", ->
    id = $(@).attr("id").split("-")[2]
    $("#delete_"+id).css('display', 'block')
    return

  $("body").on "mouseleave", ".mynote-content", ->
    id = $(@).attr("id").split("-")[2]
    $("#delete_"+id).css('display', 'none')
    return
  jQuery ->
    $('#my-note-posts').sortable
      axis: 'y'
      update: ->
         $.post($(this).data('update-url'), $(this).sortable('serialize'))
    return

  return


