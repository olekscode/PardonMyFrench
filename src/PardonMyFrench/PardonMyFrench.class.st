Class {
	#name : #PardonMyFrench,
	#superclass : #Object,
	#instVars : [
		'languageDetector'
	],
	#category : #PardonMyFrench
}

{ #category : #'as yet unclassified' }
PardonMyFrench >> foreignCommentsInPackage: aPackage [

	| methods comments foreignComments |
	
	methods := aPackage methods.
	comments := OrderedCollection new.
	
	methods do: [ :method |
		method comments do: [ :comment |
			comments add: (
				PardonForeignObject new
					text: comment;
					languageProbabilities: (languageDetector languageProbabilitiesFor: comment);
					method: method;
					yourself) ]
	] displayingProgress: [ :method | method name ].
	
	foreignComments := comments
		reject: [ :comment |
			(#('english' 'other') includes: comment languageProbabilities keys first) or: [ 
				comment languageProbabilities values first = 0 ] ].
	
	^ foreignComments 
]

{ #category : #'as yet unclassified' }
PardonMyFrench >> foreignCommentsInPackages: aCollectionOfPackages [

	| comments |
	comments := OrderedCollection new.
	
	aCollectionOfPackages
		do: [ :package | comments addAll: (self foreignCommentsInPackage: package) ]
		displayingProgress: [ :package | package name ].

	^ comments
]

{ #category : #initialization }
PardonMyFrench >> initialize [
	super initialize.
	languageDetector := LanguageDetector new.
]

{ #category : #accessing }
PardonMyFrench >> languageDetector [

	^ languageDetector
]
