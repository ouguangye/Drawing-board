import QtQuick 2.0

Rectangle
{
    id: colorSquare;

    property int length

    width: length
    height: length
    color: "green"
    signal clicked
    property bool active: false
    border.color: active? "#666666" : "#f0f0f0"
    border.width: length*0.1

    radius:length

    MouseArea
    {
        id: area
        anchors.fill :parent
        onClicked:
        {
            colorSquare.clicked()
        }
    }

    Component.onCompleted: {
        //console.log("index: " + index)
    }
}
