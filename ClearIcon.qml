import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Item{
    property double myWidth:50
    property double myHeight:50

    width: myWidth
    height: myHeight

    Component.onCompleted: {
        console.log("size: "+myWidth)
    }

    Image{
        source:"qrc:/resource/resource/clear.svg"
        width:parent.width
        height:parent.height

        property bool hover: false

        ToolTip {
            parent: parent
            visible: parent.hover
            text: "清空画布"
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true

            onClicked:{
                id_mesDialog.open()
            }

            onEntered:
            {
                parent.hover = true
            }

            onExited:
            {
                parent.hover = false
            }
        }
    }

    MessageDialog {
        id:id_mesDialog
        title: "警告"
        icon: StandardIcon.Warning
        text: "确定清除画布?"
        standardButtons: StandardButton.Yes |StandardButton.No
        Component.onCompleted: visible = false
        onYes: canvas.clearMyCanvas();
    }
}
