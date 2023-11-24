#!/usr/bin/env bash
echo "Logger: START build.sh"

## --------------------------------------------------------
## ---- Configurable variable name
PROJECTNAME="iOSFramework"
SCHEMENAME="iOSFramework"
FRAMEWORK="iOSFramework"
DESTINATION="Framework"
PROJECTDEMO="iOSFramework"

## ---- Clean up existing directory if it exists
rm -rf archives
rm -rf xcframeworks
rm -rf $PROJECTDEMO/$FRAMEWORK.xcframework

## ---- Archive for platform=iOS
xcodebuild clean archive \
    -workspace $PROJECTNAME.xcworkspace \
    -scheme $SCHEMENAME \
    -destination "generic/platform=iOS" \
    -archivePath "archives/$DESTINATION"

## ---- Archive for platform=iOS Simulator
xcodebuild clean archive \
    -workspace $PROJECTNAME.xcworkspace \
    -scheme $SCHEMENAME \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "archives/$DESTINATION-Simulator"

## ---- Generate the xcframework
xcodebuild -create-xcframework \
    -archive archives/$DESTINATION.xcarchive -framework $FRAMEWORK.framework \
    -archive archives/$DESTINATION-Simulator.xcarchive -framework $FRAMEWORK.framework \
    -output xcframeworks/$FRAMEWORK.xcframework

cp -r xcframeworks/$FRAMEWORK.xcframework $PROJECTDEMO/

# cp README.md $PROJECTDEMO/

echo "Logger: END build.sh"
