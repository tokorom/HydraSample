#!/bin/sh

frameworks=(
  Hydra.framework
)

inputFileListFile="Carthage/input.xcfilelist"
outputFileListFile="Carthage/output.xcfilelist"

rm $inputFileListFile
rm $outputFileListFile

for val in ${frameworks[@]}
do
  echo "\$(SRCROOT)/Carthage/Build/iOS/$val" >> $inputFileListFile
  echo "\$(BUILT_PRODUCTS_DIR)/\$(FRAMEWORKS_FOLDER_PATH)/$val" >> $outputFileListFile
done
