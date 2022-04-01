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
			baseline: 'NgramModel'
			with: [ spec repository: 'github://pharo-ai/NgramModel/src' ].
			
		spec
			baseline: 'IdentifierNameSplitter'
			with: [ spec repository: 'github://olekscode/IdentifierNameSplitter/src' ].
				
		"Packages"
		spec 
			package: 'PardonMyFrench' with: [ spec requires: #('NgramModel' 'IdentifierNameSplitter') ];
			package: 'PardonMyFrench-Tests' with: [ spec requires: #('PardonMyFrench') ] ].
]
