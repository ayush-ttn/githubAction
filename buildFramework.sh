#!/bin/sh

#  buildFramework.sh
#  
#
#  Created by Ayush Awasthi on 05/02/25.
#

# Exit immediately if any command fails
set -e

# Define framework name
FRAMEWORK_NAME="GithubActiondemo"

# Define output directories
BUILD_DIR="build"
XCFRAMEWORK_OUTPUT="${FRAMEWORK_NAME}.xcframework"

# Clean previous build
rm -rf "$BUILD_DIR" "$XCFRAMEWORK_OUTPUT"

cd GithubActiondemo
cd GithubActiondemo

# Build for iOS
xcodebuild archive \
    -scheme "$FRAMEWORK_NAME" \
    -destination "generic/platform=iOS" \
    -archivePath "$BUILD_DIR/${FRAMEWORK_NAME}-iOS.xcarchive" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Build for iOS Simulator
xcodebuild archive \
    -scheme "$FRAMEWORK_NAME" \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "$BUILD_DIR/${FRAMEWORK_NAME}-Simulator.xcarchive" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Create XCFramework
xcodebuild -create-xcframework \
    -framework "$BUILD_DIR/${FRAMEWORK_NAME}-iOS.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -framework "$BUILD_DIR/${FRAMEWORK_NAME}-Simulator.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -output "$XCFRAMEWORK_OUTPUT"

# Print success message
echo "✅ Successfully created ${XCFRAMEWORK_OUTPUT}"
