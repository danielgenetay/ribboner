PATH=${PATH}:/usr/local/bin
IFS=$'\n'
#buildNumber=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}")

function generateIcon () {
  BASE_IMAGE_NAME=$1
  TYPE=$2

  #TARGET_PATH="${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/${BASE_IMAGE_NAME}"
  SRCROOT="."
  BASE_IMAGE_PATH=$(find ${SRCROOT} -name ${BASE_IMAGE_NAME})
  WIDTH=$(identify -format %w ${BASE_IMAGE_PATH})
  FONT_SIZE=$(echo "$WIDTH * .15" | bc -l)

  convert $TYPE-ribbon.png -resize $WIDTHx$WIDTH resized-$TYPE-ribbon.png
  #convert ${BASE_IMAGE_PATH} -fill white -font Times-Bold -pointsize $FONT_SIZE -gravity south -annotate 0 "Hello World" - | composite resized-$TYPE-ribbon.png - $TYPE-${BASE_IMAGE_NAME}
  composite resized-$TYPE-ribbon.png ${BASE_IMAGE_NAME} $TYPE-${BASE_IMAGE_NAME}
}

generateIcon "dn-app-icon.png" "beta"
generateIcon "dn-app-icon.png" "dev"
generateIcon "dn-app-icon.png" "stage"
generateIcon "e-dn-app-icon.png" "beta"
generateIcon "e-dn-app-icon.png" "dev"
generateIcon "e-dn-app-icon.png" "stage"
generateIcon "dnvr-app-icon.png" "beta"
generateIcon "dnvr-app-icon.png" "dev"
generateIcon "dnvr-app-icon.png" "stage"
generateIcon "di-app-icon.png" "beta"
generateIcon "di-app-icon.png" "dev"
generateIcon "di-app-icon.png" "stage"
generateIcon "di-epaper-app-icon.png" "beta"
generateIcon "di-epaper-app-icon.png" "dev"
generateIcon "di-epaper-app-icon.png" "stage"
