# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#
document.addEventListener "turbolinks:load", ->

  jQuery ->
    $('ul.yeahap-ul').sortable
      connectWith: ".yeahap-ul"
      placeholder: "yeahap-li-placeholder"
      start: ->
        $("#main_flash_message").text("drag and drop to sort your yeahaps")
        $("#main_flash_message").css("display", "inline")
      update: (event, ui) ->
        $.post($(this).data('update-url'),{target_yeahap: $(ui.item).attr("id").split('_')[1], yeahaps: $(this).sortable('serialize'), box_id: this.id.split("_")[1] })
      stop: ->
        $("#main_flash_message").hide()
    return

  return



