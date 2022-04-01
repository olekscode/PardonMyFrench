# PardonMyFrench


[![Build status](https://github.com/olekscode/PardonMyFrench/workflows/CI/badge.svg)](https://github.com/olekscode/PardonMyFrench/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/PardonMyFrench/badge.svg?branch=master)](https://coveralls.io/github/olekscode/PardonMyFrench?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/PardonMyFrench/master/LICENSE)

A tool for detecting foreign language (non-English) comments and identifiers in Pharo code.

## How to install it

To install `PardonMyFrench`, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'PardonMyFrench';
  repository: 'github://olekscode/PardonMyFrench/src';
  load.
```

## How to depend on it

If you want to add a dependency on `PardonMyFrench` to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'PardonMyFrench'
  with: [ spec repository: 'github://olekscode/PardonMyFrench/src' ].
```

## How to use it


