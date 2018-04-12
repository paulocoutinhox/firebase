# Firebase test with carthage

This is a example project only to test Firebase with carthage.  

## Make

I have create a simple Makefile to easy update and clear carthage things, so simple.

> make help  

> make carthage-clear  
> make carthage-clear-cache  
> make carthage-update  

> make build
> make deploy 

## Firebase for carthage

Im using this repository instructions:  

https://github.com/firebase/firebase-ios-sdk

## Problem - 12/04/2018

Before add all frameworks and run script phase the project is running without problems. After add all, im receiving this error:  

<img src="extras/images/error001.png">  

## Deploy

To deploy using command line you need **node** and **ios-deploy** tool:

> brew install node  
> npm install -g ios-deploy  