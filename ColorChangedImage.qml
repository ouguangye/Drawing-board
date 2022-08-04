import QtQuick 2.0
import QtGraphicalEffects 1.0

Image {
    property string imageSource
    property double imageWidth
    property double imageHeight
    property color imageColor
    property bool isVisible:true

    source: imageSource
    width: imageWidth
    height: imageHeight
    visible: isVisible
    smooth: true

    layer{
        enabled: true
        effect: ColorOverlay{
            color: imageColor
        }
    }
}

