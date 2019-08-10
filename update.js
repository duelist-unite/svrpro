var moment = require('moment');
var exec = require('child_process').exec;
var check = function () {
  var now = moment();
  if (now.minute() == 10) {
    console.log("Time to update!");
    exec('./update.sh');
    setTimeout(check, 60000);
  } else {
    setTimeout(check, 59900);
  }
}
setTimeout(check, 60000);
