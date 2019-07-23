var moment = require('moment');
var exec = require('child_process').exec;
var check = function () {
	var now = moment();
	if (now.hour() == 4 && now.minute() == 35) {
		console.log("Time to update!");
		exec('./sync.sh');
		setTimeout(check, 59000);
	} else {
		setTimeout(check, 59000);
	}
}
setTimeout(check, 60000);
