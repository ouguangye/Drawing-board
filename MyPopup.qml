import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Popup {
     id: popup

     property double myWidth
     property double myHeight
     property double colorSize
     property double myX
     property double myY

     width: myWidth
     height: myHeight

     x: myX
     y: myY
     modal: true
     focus: true

     closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent


     GridLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        columns: 4
        Repeater{
            model: ["#1abc9c","#2ecc71","#3498db","#9b59b6",
                "#34495e","#f1c40f","#e67e22","#e74c3c","#ecf0f1",
                "#95a5a6","#16a085","#27ae60","#2980b9","#8e44ad"]
            ColorSquare
            {
                length: colorSize
                color: modelData;
                active: colorTools.isPen && colorTools.paintColor === color
                onClicked:
                {
                    //console.log("isPen: " + colorTools.isPen)
                    colorTools.paintColor = color
                    colorTools.isPen = true
                }
            }
        }
     }
}
