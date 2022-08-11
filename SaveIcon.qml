import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Item {
    Image{
        anchors.fill: parent
        source: "qrc:/resource/resource/save.svg"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                dialog.open()
            }
        }
    }


    Dialog {
        id: dialog
        title: "Title"
        Row {
            spacing: 10
            anchors.centerIn: parent

            Text {
                text: qsTr("请输入图片名称：") ;
                font.pointSize: 10
                verticalAlignment: Text.AlignVCenter
            }

            Rectangle {
                width:100
                height: 20
                color: "lightgrey"
                border.color: "grey"

                TextInput {
                    id:textInput
                    anchors.fill: parent
                    anchors.margins: 2
                    font.pointSize: 10
                    focus: true
                }
            }
        }

        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted:{
            canvas_rectangle.grabToImage(function(result) {
                result.saveToFile(textInput.text+".png")
                id_mesDialog.open()
            });
        }
    }

    MessageDialog {
        id:id_mesDialog
        title: "提示"
        icon: StandardIcon.Information
        text: "图片保存成功！"
        standardButtons: StandardButton.Yes
        Component.onCompleted: visible = false
   }
}
