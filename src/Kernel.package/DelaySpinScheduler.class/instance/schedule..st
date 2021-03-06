low priority processes
schedule: aDelay
	"Depends on implicit semantics of bytecode inlining and cooperative multitasking 
	 such that no interuption can occur between the nil test, assignment & signal."
	
	"scheduledDelay is consumed at set to nil by #handleTimerEvent: 
	 which runs at highestPriority(80) after being woken by the signal."
	
	aDelay schedulerBeingWaitedOn ifTrue: [^self error: 'This Delay has already been scheduled.'].
	[ 	scheduledDelay == nil ifTrue: [ 
				scheduledDelay := aDelay. 
				timingSemaphore signal.
				^self
				].
		true.
	] whileTrue.	

  	"Probably the whileTrue loop is not needed, its just for safety."