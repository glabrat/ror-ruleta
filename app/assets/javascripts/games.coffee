# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

time_left = 0

config_timer = () ->
	setInterval(getTimeLeft, 1000)
	time_left = document.querySelector(".time_rounds").innerText

getTimeLeft = () -> 
  
  time_left -= 1;
  document.querySelector(".timer").innerHTML = time_left 

$(document).ready -> 
	config_timer()