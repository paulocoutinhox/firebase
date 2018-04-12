ROOT_DIR=${PWD}
PROJECT_NAME=FirebaseTest

.DEFAULT_GOAL := help

# general
help:
	@echo "Type: make [rule]. Available options are:"
	@echo ""
	@echo "- help"
	@echo ""
	@echo "- carthage-update"
	@echo "- carthage-clear"
	@echo "- carthage-clear-cache"	
	@echo ""
	@echo "- build-device"	
	@echo "- build-simulator"	
	@echo ""
	@echo "- run-device"	
	@echo "- run-simulator"
	@echo ""

carthage-update:
	carthage update --platform iOS

carthage-build:
	carthage build --platform iOS

carthage-clear:
	rm -rf Carthage
	rm -rf Cartfile.resolved

carthage-clear-cache:
	rm -rf ~/Library/Caches/org.carthage.CarthageKit

build-device:
	xcrun xcodebuild \
		-target ${PROJECT_NAME} \
		build

build-simulator:
	xcrun xcodebuild \
  		-scheme ${PROJECT_NAME} \
  		-project ${PROJECT_NAME}.xcodeproj \
  		-configuration Debug \
  		-destination 'name=iPhone 7' \
  		-derivedDataPath \
  		build

run-device:
	make build-device
	ios-deploy --debug --bundle ./build/Release-iphoneos/${PROJECT_NAME}.app

run-simulator:
	make build-simulator
	ios-sim launch ./build/Build/Products/Debug-iphonesimulator/${PROJECT_NAME}.app --devicetypeid=iPhone-7