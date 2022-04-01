Class {
	#name : #PardonMyFrench,
	#superclass : #Object,
	#instVars : [
		'englishLanguageModel',
		'foreignLanguageModel'
	],
	#category : #PardonMyFrench
}

{ #category : #'as yet unclassified' }
PardonMyFrench class >> forFrenchLanguage [

	^ self new
		loadFrenchLanguageModel;
		yourself.
]

{ #category : #'as yet unclassified' }
PardonMyFrench >> asCleanSentence: aString [
	"Convert to lowercase, replace all whitespaces with spaces, split identifier names into words, remove all non-alphabetic characters"
	
	| tokens words |

	tokens := aString substrings.
	tokens := tokens flatCollect: [ :token | token splitIdentifierName ].
	
	words := tokens
		select: [ :token | token allSatisfy: [ :character | character isLetter ] ]
		thenCollect: [ :word | word asLowercase ].
	
	^ ' ' join: words
	
	
]

{ #category : #accessing }
PardonMyFrench >> englishLanguageModel: aModel [

	englishLanguageModel := aModel
]

{ #category : #'as yet unclassified' }
PardonMyFrench >> englishProbabilityOf: aString [

	| cleanSentence characters |
	cleanSentence := self asCleanSentence: aString.
	characters := cleanSentence asOrderedCollection.
	
	^ englishLanguageModel logProbabilityOfText: characters.
]

{ #category : #'as yet unclassified' }
PardonMyFrench >> foreignCommentsInPackage: aPackage [

	| methods comments  |
	methods := aPackage methods.
	comments := methods flatCollect: [ :method | method comments ].
	
	^ comments select: [ :comment |
		self isForeign: comment ]
]

{ #category : #'as yet unclassified' }
PardonMyFrench >> foreignProbabilityOf: aCollectionOfCharacters [
	
	^ englishLanguageModel logProbabilityOfText: aCollectionOfCharacters.
]

{ #category : #initialization }
PardonMyFrench >> initialize [

	super initialize.
	self loadEnglishLanguageModel.
]

{ #category : #'as yet unclassified' }
PardonMyFrench >> isForeign: aString [
	
	| englishProbability foreignProbability cleanSentence characters |
	
	cleanSentence := self asCleanSentence: aString.
	characters := cleanSentence asOrderedCollection.
	
	englishProbability := englishLanguageModel logProbabilityOfText: characters.
	foreignProbability := foreignLanguageModel logProbabilityOfText: characters.
	
	^ foreignProbability > englishProbability
]

{ #category : #'loading language models' }
PardonMyFrench >> loadEnglishLanguageModel [
]

{ #category : #'loading language models' }
PardonMyFrench >> loadFrenchLanguageModel [
]
