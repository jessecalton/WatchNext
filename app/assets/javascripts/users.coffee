# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# for login button
$(document).ready ->
  $('button.btn.blue').click ->
    $('#login-form').toggle()
    $('#demo-form').hide()
    return



  $('button.btn.red').click ->
    $('#demo-form').toggle()
    $('#login-form').hide()
    return



  $('button.btn.black').click ->
    $('#about').toggle()
    $('html, body').scrollTop $('#about-button').offset().top
    return



  $('p#advanced-search').click ->
    $('form.search-form.advanced').toggle()
    return



  $('button.btn.blue').click ->
    $('#movie-search-form').addClass('highlight').delay(2300).queue ->
      $(this).removeClass('highlight').dequeue()
      return
    return

   $('button.btn.red').click ->
    $('#watch-movie-form').addClass('highlight').delay(2300).queue ->
      $(this).removeClass('highlight').dequeue()
      return
    return   
  return  