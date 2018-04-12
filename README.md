# Firebase test with carthage

This is a example project only to test Firebase with carthage.  

## Make

I have create a simple Makefile to easy update and clear carthage things, so simple.

> make help  

> make carthage-clear  
> make carthage-clear-cache  
> make carthage-update  

> make build-device  
> make build-simulator  

> make deploy-device  
> make deploy-simulator  

## Firebase for carthage

Im using this repository instructions:  

https://github.com/firebase/firebase-ios-sdk

## Run on device

To run on device using command line you need **node** and **ios-deploy** tool:

> brew install node  
> npm install -g ios-deploy  

## Run on simulator

To run on simulator using command line you need **node** and **ios-deploy** tool:

> brew install node  
> npm install -g ios-sim  

## Problem - 12/04/2018

Before add all frameworks and run script phase the project is running without problems. After add all, im receiving this error:  

<img src="extras/images/error001.png">  

When i run "make run-simulator", i got:

```
ios-sim launch ./build/Build/Products/Debug-iphonesimulator/FirebaseTest.app --devicetypeid=iPhone-7
An error was encountered processing the command (domain=IXUserPresentableErrorDomain, code=1):
This app could not be installed at this time.
Underlying error (domain=MIInstallerErrorDomain, code=57):
	Found bundle at /Users/paulo/Library/Developer/CoreSimulator/Devices/CE49D8E9-CC06-4398-9ED1-D11DB21B64C9/data/Library/Caches/com.apple.mobile.installd.staging/temp.NvZWu9/extracted/FirebaseTest.app/Frameworks/FirebaseCore.framework with the same identifier (com.firebase.Firebase) as bundle at /Users/paulo/Library/Developer/CoreSimulator/Devices/CE49D8E9-CC06-4398-9ED1-D11DB21B64C9/data/Library/Caches/com.apple.mobile.installd.staging/temp.NvZWu9/extracted/FirebaseTest.app/Frameworks/Protobuf.framework
```
