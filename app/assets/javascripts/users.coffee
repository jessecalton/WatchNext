# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# for login button
$(document).ready ->
  $('button.btn.blue').click ->
    $('.login-form').toggle()
    $('.demo-form').hide()
    return
  return

$(document).ready ->
  $('button.btn.green').click ->
    $('.demo-form').toggle()
    $('.login-form').hide()
    return
  return

$(document).ready ->
  $('button.btn.black').click ->
    $('#about').toggle()
    return
  return