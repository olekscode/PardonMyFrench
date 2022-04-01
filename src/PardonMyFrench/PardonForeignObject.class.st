Class {
	#name : #PardonForeignObject,
	#superclass : #Object,
	#instVars : [
		'text',
		'method'
	],
	#category : #PardonMyFrench
}

{ #category : #accessing }
PardonForeignObject >> method [

	^ method
]

{ #category : #accessing }
PardonForeignObject >> method: anObject [

	method := anObject
]

{ #category : #printing }
PardonForeignObject >> printOn: aStream [

	aStream nextPutAll: text
]

{ #category : #accessing }
PardonForeignObject >> text [

	^ text
]

{ #category : #accessing }
PardonForeignObject >> text: anObject [

	text := anObject
]
