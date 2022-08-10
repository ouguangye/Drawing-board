import QtQuick 2.9
import QtQuick.Window 2.2

Window
{
    visible: true
    width: 900
    height: 600

    title: "WritePad"

    ColorTools{
        id:colorTools
        anchors.bottomMargin: 20
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
        lineWidth: 1
    }


}
