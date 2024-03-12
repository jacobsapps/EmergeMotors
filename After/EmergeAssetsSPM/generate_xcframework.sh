# /bin/bash!

# Build framework for iOS
xcodebuild -project ../EmergeAssets/EmergeAssets.xcodeproj \
    -scheme EmergeAssets \
    -configuration Release \
    -sdk iphoneos \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO

# Build framework for Simulator
xcodebuild -project ../EmergeAssets/EmergeAssets.xcodeproj \
    -scheme EmergeAssets \
    -configuration Release \
    -sdk iphonesimulator \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO

# To find the Build Products directory, you can either: 
# 1. Manually build the framework and look in Derived Data 
# 2. run `xcodebuild -project EmergeAssets.xcodeproj -scheme EmergeAssets -showBuildSettings` and search for BUILT_PRODUCTS_DIR
PRODUCTS_DIR=~/Library/Developer/Xcode/DerivedData/EmergeAssets-fuszllvjudzokhdzeyiixzajigdl/Build/Products

rm -r EmergeAssets.xcframework

# Generate xcframework from build products
xcodebuild -create-xcframework \
    -framework $PRODUCTS_DIR/Release-iphoneos/EmergeAssets.framework \
    -framework $PRODUCTS_DIR/Release-iphonesimulator/EmergeAssets.framework \
    -output EmergeAssets.xcframework