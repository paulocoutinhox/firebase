ROOT_DIR=${PWD}

.DEFAULT_GOAL := help

# general
help:
	@echo "Type: make [rule]. Available options are:"
	@echo ""
	@echo "- help"
	@echo "- carthage-update"
	@echo "- carthage-clear"
	@echo "- carthage-clear-cache"	
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

