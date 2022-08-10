import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Item{
    id:inkIcon
    property double length

    width:  length
    height: length

    ColorChangedImage{
        id:ink
        imageSource:"qrc:/resource/resource/ink.svg"
        imageWidth:parent.width
        imageHeight:parent.height
        imageColor:colorTools.isPen?colorTools.paintColor:"black"
        MouseArea{
            anchors.fill: parent
            onClicked:{
                myPopup.open()
            }
        }
    }
}
