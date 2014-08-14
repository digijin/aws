(function() {
  var AWS, s3;

  AWS = require('aws-sdk');

  console.log("aws testing");

  AWS.config.loadFromPath('./config/jsmith.json');

  console.log("creds done");

  s3 = new AWS.S3();

  s3.listBuckets({}, function(err, data) {
    return console.log(err, data);
  });

}).call(this);
