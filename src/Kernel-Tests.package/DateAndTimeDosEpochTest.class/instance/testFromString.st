tests
testFromString
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1980-01-01T00:00:00+00:00').
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1980-01-01T00:00:00').
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1980-01-01T00:00').
	self assert: aDateAndTime =  (DateAndTime fromString: ' 1980-01-01T00:00:00+00:00').
