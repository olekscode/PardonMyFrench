Class {
	#name : #BaselineOfPardonMyFrench,
	#superclass : #BaselineOf,
	#category : #BaselineOfPardonMyFrench
}

{ #category : #baselines }
BaselineOfPardonMyFrench >> baseline: spec [
	<baseline>
	spec for: #common do: [	
		"External dependencies"
		spec
			baseline: 'LanguageDetector'
			with: [ spec repository: 'github://olekscode/LanguageDetector/src' ].
			
		spec
			baseline: 'IdentifierNameSplitter'
			with: [ spec repository: 'github://olekscode/IdentifierNameSplitter/src' ].
				
		"Packages"
		spec 
			package: 'PardonMyFrench' with: [ spec requires: #('LanguageDetector' 'IdentifierNameSplitter') ];
			package: 'PardonMyFrench-Tests' with: [ spec requires: #('PardonMyFrench') ] ].
]
