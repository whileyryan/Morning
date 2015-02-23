$(document).ready(function(){
  setUserTime();
  setInterval(function(){ 
    setUserTime();
  }, 30000);
});

function setUserTime(){
  var d = new Date();
  var hours = d.getHours(); 
  var mins = d.getMinutes(); 
  var time = hours+':'+mins;
  $('.time').empty();
  $('.time').append(time);
}

