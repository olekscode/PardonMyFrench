Class {
	#name : #PardonMyLanguage,
	#superclass : #Object,
	#instVars : [
		'languageDetector'
	],
	#category : #PardonMyFrench
}

{ #category : #'as yet unclassified' }
PardonMyLanguage >> foreignCommentsInPackage: aPackage [

	| methods foreignComments |
	
	methods := aPackage methods.
	foreignComments := OrderedCollection new.
	
	methods do: [ :method |
		method comments 
			select: [ :comment | languageDetector isForeign: comment ]
			thenDo: [ :comment | foreignComments add: (
				PardonForeignObject new
					text: comment;
					method: method;
					yourself) ] ].
	
	^ foreignComments 
]

{ #category : #'as yet unclassified' }
PardonMyLanguage >> foreignCommentsInPackages: aCollectionOfPackages [

	| comments |
	comments := OrderedCollection new.
	
	aCollectionOfPackages
		do: [ :package | comments addAll: (self foreignCommentsInPackage: package) ]
		displayingProgress: [ :package | package name ].

	^ comments
]

{ #category : #'as yet unclassified' }
PardonMyLanguage >> foreignLanguage [

	self subclassResponsibility
]

{ #category : #initialization }
PardonMyLanguage >> initialize [
	super initialize.
	languageDetector := PardonLanguageDetector for: self foreignLanguage.
]
