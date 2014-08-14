# console.log "test"

AWS = require 'aws-sdk'
fs = require 'fs'

creds = {
	"accessKeyId": "broken"
	"secretAccessKey": "broken"
	"region": "ap-southeast-2"
}



AWS.config.update(creds)
console.log "creds done"



appmode = {
	accessKeyId: 'broken'
	secretAccessKey: 'broken'
}


doIAM = () ->
	iam = new AWS.IAM()
	getUser = (name, callback) ->
		iam.getUser {UserName: name}, callback
	createRole = (name, policy, trust, callback) ->
		iam.createRole {
			AssumeRolePolicyDocument: trust
			RoleName: name
		}, (err, data) ->
			iam.PutRolePolicy {
				RoleName: name
				PolicyName: name+'_policy'
				PolicyDocument: policy
			}



# doIAM()


doS3 = () ->
	s3 = new AWS.S3();
	s3.getObject {Bucket: 'mydigibucket', Key: 'test.txt'}, (err, data) -> 
	  console.log err, data
	  console.log data.Body.toString()


	s3.listBuckets {}, (err, data) ->
		console.log err, data

	s3.createBucket {Bucket: 'yoloswagbucket123rekt'}, ->
		console.log "bucket made"

		img = fs.readFileSync 'img.jpg' 

		s3.putObject {
			Bucket: 'yoloswagbucket123rekt'
			Key: 'img.jpg'
			Body: img
		}, (err, data) ->
			console.log err, data


doS3()