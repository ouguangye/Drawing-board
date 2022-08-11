import QtQuick 2.9
import QtQuick.Window 2.2

Window
{
    visible: true
    width: 900
    height: 600

    visibility:"Maximized"
    title: "WritePad"

    ColorTools{
        id:colorTools
        anchors.bottomMargin: 20
    }

    Rectangle{
        id:canvas_rectangle
        z:0
        anchors
        {
            left: parent.left;
            right:parent.right;
            top:colorTools.bottom;
            bottom: parent.bottom;
            margins: 8 + border.borderLength
        }

        MyCanvas{
            id:canvas
            color:colorTools.paintColor
            lineWidth: 1
            z:1
            anchors
            {
                left: parent.left;
                right:parent.right;
                top:parent.top;
                bottom: parent.bottom;
            }
        }
    }


    BorderImage {
        id:border
        property double borderLength:60
        anchors.fill: canvas_rectangle
        z:-1
        anchors {
            leftMargin: -borderLength
            topMargin: -borderLength
            rightMargin: -borderLength
            bottomMargin: -borderLength
        }
        border {
            left: borderLength
            top: borderLength
            right: borderLength
            bottom: borderLength
        }
        source: "qrc:/resource/resource/border.jpeg"
        smooth: true
    }
}
