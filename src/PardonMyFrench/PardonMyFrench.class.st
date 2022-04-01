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

{ #category : #initialization }
PardonMyFrench >> initialize [

	super initialize.
	self loadEnglishLanguageModel.
]

{ #category : #'loading language models' }
PardonMyFrench >> loadEnglishLanguageModel [
]

{ #category : #'loading language models' }
PardonMyFrench >> loadFrenchLanguageModel [
]
