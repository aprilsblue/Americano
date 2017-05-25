# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener "turbolinks:load", ->
  $(document).on "click", ".title-counter", (event) ->
    child = $(this).children("span.box-title")
    cursorPosition = child.prop("selectionStart")
    console.log(cursorPosition)
    inner_text = child.text()
    console.log(inner_text)
    box_id = child.attr("id")
    $(this).prepend("<input class='title-edit-input' value='" + inner_text + "'/>")
    $('.title-edit-input').focus()
    child.remove()
    $('html').one('click', (e) ->
      edit_text = $('.title-edit-input').val()
      $('.title-edit-input').parent("div").prepend("<span class='box-title' id=" + box_id + ">" + edit_text +  "</span>")
      $('.title-edit-input').remove()
      $.post('yeahapboxes/update', {box_id: box_id.split("_")[1], box_title: edit_text})
    )
    event.stopPropagation()
    return

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
      helper: (event, ui) ->
        $clone =  $(ui).clone()
        $clone .css('position','absolute')
        return $clone.get(0)
    return
  return
