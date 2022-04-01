Class {
	#name : #PardonLanguageDetector,
	#superclass : #Object,
	#instVars : [
		'englishLanguageModel',
		'foreignLanguageModel',
		'foreignLanguageName'
	],
	#category : #PardonMyFrench
}

{ #category : #'instance creation' }
PardonLanguageDetector class >> for: aLanguageName [

	^ self new
		loadForeignLanguageModel: aLanguageName;
		yourself.
]

{ #category : #'as yet unclassified' }
PardonLanguageDetector class >> languageModelDirectory [

	^ 'pharo-local/iceberg/olekscode/PardonMyFrench/language-models/' asFileReference
]

{ #category : #initialization }
PardonLanguageDetector >> initialize [

	super initialize.
	self loadEnglishLanguageModel.
]

{ #category : #'as yet unclassified' }
PardonLanguageDetector >> isForeign: aString [
	
	| englishProbability foreignProbability cleanSentence characters |
	
	cleanSentence := aString asCleanSentence.
	characters := cleanSentence asOrderedCollection.
	
	englishProbability := englishLanguageModel logProbabilityOfText: characters.
	foreignProbability := foreignLanguageModel logProbabilityOfText: characters.
	
	^ foreignProbability > englishProbability
]

{ #category : #'loading language models' }
PardonLanguageDetector >> loadEnglishLanguageModel [

	englishLanguageModel := self loadLanguageModel: 'english'.
]

{ #category : #'loading language models' }
PardonLanguageDetector >> loadForeignLanguageModel: aLanguageName [

	foreignLanguageModel := self loadLanguageModel: aLanguageName.
]

{ #category : #'loading language models' }
PardonLanguageDetector >> loadLanguageModel: aLanguageName [

	| file |
	file := self class languageModelDirectory / (aLanguageName, '.ston').
	^ NgramModel readFromFile: file.
]
