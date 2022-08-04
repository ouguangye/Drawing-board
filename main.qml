import QtQuick 2.9
import QtQuick.Window 2.2

Window
{
    visible: true
    width: 640
    height: 480

    title: "WritePad"

    ColorTools{
        id:colorTools
    }

    Rectangle
    {
        anchors.fill: canvas
        border.color: "#666"
        border.width: 4;
    }


    MyCanvas{
        id:canvas
        color:colorTools.paintColor
        lineWidth: 3
    }


}
