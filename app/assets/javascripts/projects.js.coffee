# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
jQuery ($) ->
  $(".dd").nestable()
  $(".dd-handle a").on "mousedown", (e) ->
    e.stopPropagation()
    return

  $("[data-rel=\"tooltip\"]").tooltip()

  $("input[name=date-range-picker]").daterangepicker()

