# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# for login button
$(document).ready ->
  $('button').click ->
    $('.login-form').toggle()
    return
  return