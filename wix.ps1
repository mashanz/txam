mkdir temp
cd temp


curl  https://github.com/wixtoolset/wix3/releases/download/wix3112rtm/wix311-binaries.zip -LO 

Expand-Archive ./wix311-binaries.zip -DestinationPath ./WixTools

curl  https://github.com/tauri-apps/binary-releases/releases/download/nsis-3/nsis-3.zip -LO 

Expand-Archive ./nsis-3.zip -DestinationPath ./NSIS

mv .\NSIS\nsis-3.*\* .\NSIS
rmdir .\NSIS\nsis-3.*


curl https://github.com/tauri-apps/binary-releases/releases/download/nsis-plugins-v0/NSIS-ApplicationID.zip -LO

Expand-Archive .\NSIS-ApplicationID.zip -DestinationPath .\NSIS-ApplicationID

mv .\NSIS-ApplicationID\Release\* .\NSIS\Plugins\x86-unicode

# curl https://github.com/tauri-apps/nsis-tauri-utils/releases/download/nsis_tauri_utils-v0.1.1/nsis_tauri_utils.dll -LO

curl https://github.com/tauri-apps/nsis-tauri-utils/releases/download/nsis_tauri_utils-v0.2.2/nsis_tauri_utils.dll -LO

mv .\nsis_tauri_utils.dll .\NSIS\Plugins\x86-unicode

mv .\NSIS ~\AppData\Local\tauri\NSIS
mv .\WixTools ~\AppData\Local\tauri\WixTools

echo "rm temp dir"

rm -r .\NSIS-ApplicationID
rm .\nsis-3.zip
rm .\NSIS-ApplicationID.zip
rm .\wix311-binaries.zip
rm .\temp

echo "done"
