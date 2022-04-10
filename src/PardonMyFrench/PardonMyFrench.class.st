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

{ #category : #'as yet unclassified' }
PardonMyFrench >> foreignMethodNamesInPackage: aPackage [

	| nameAsSentence methodNames foreignMethodNames |
	
	methodNames := aPackage methods collect: [ :method |
		nameAsSentence := ' ' join: method selector splitIdentifierName.
		
		PardonForeignObject new
			text: method selector;
			languageProbabilities: (languageDetector languageProbabilitiesFor: nameAsSentence);
			method: method;
			yourself ].
	
	foreignMethodNames := methodNames
		reject: [ :methodName |
			(#('english' 'other') includes: methodName languageProbabilities keys first) or: [ 
				methodName languageProbabilities values first = 0 ] ].
	
	^ foreignMethodNames 
]

{ #category : #'as yet unclassified' }
PardonMyFrench >> foreignMethodNamesInPackages: aCollectionOfPackages [

	| methodNames |
	methodNames := OrderedCollection new.
	
	aCollectionOfPackages
		do: [ :package | methodNames addAll: (self foreignMethodNamesInPackage: package) ]
		displayingProgress: [ :package | package name ].

	^ methodNames
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
