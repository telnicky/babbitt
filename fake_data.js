
// Sleep data will consist of accelerometer samples taken at five minute 
// intervals throughout the night.
function sampleSleepData(amp, wt) {
  var x = (amp * Math.sin(wt)) + 100,
      y = amp * Math.sin(wt),
      z = (amp * Math.sin(wt)) - 100;
  return {x: x, y: y, z: z};
}

function fillSleepData() {
  var sleep_arr = [];
  for(var i = 0; i < 200; i++) {
   sleep_arr[i] = sampleSleepData(40, i);
  }

  return sleep_arr;
}

function printXYZ(xyz) {
  el = '<span>' + xyz.x + ', ' + xyz.y + ', ' + xyz.z + ' </span>'
  $('.data').append(el);
}

function printSleepData(data) {
  _.each(data, printXYZ);
}

// Step data will contain an array of step counts. 
//   The step count will be placed in a queue and reset every five minutes. 

// The heart rate data will be an array of structs containing the beat count, beat frequency, oxygen level, and the amplitude of the heartbeat. 
//   Like the step struct, a new heart rate struct will be generated every five minutes.





