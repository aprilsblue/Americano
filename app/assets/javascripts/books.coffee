# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".card-book").hover ->
    $(@).find(".book-info").attr("style", "display:block")
    return
  return

$ ->
  $(".card-book").mouseleave ->
    $(@).find(".book-info").attr("style", "display:none")
    return
  return
