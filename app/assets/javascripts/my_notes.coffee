# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".mynote-content").on "mouseover", ->
    id = $(@).attr("id").split("-")[2]
    $("#delete_"+id).css('display', 'block')
    return

  $(".mynote-content").on "mouseleave", ->
    id = $(@).attr("id").split("-")[2]
    $("#delete_"+id).css('display', 'none')
    return
  return

