import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Popup {
     id: popup

     property double myWidth
     //property double myHeight
     property double colorSize
     property double myX
     property double myY

     width: myWidth
     //height: myHeight

     x: myX
     y: myY
     modal: true
     focus: true

     closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent


     GridLayout {
         id:layout
         anchors.left: parent.left
         anchors.leftMargin: 35
         columns: 4
         Repeater{
             model: [
                 "#c12c1f","#a72126","#f09199","#e60012","#dd7694", //红，5

                 "#81663b","#9f6027","#d3a237","#fac03d",
                 "#e18a3b","#b6a014","#ecd452","#ffee6f",  //黄，9

                 "#84a729","#b7d332","#68945c","#a8bf8f", //绿，4
                 "#108b96","#5aa4ae","#87c0ca", //浅蓝，3
                 "#06436f","#547689","#106898","#422256",//深蓝，4
                 "#6c216d","#8a1874", //紫，2
                 "#95949a","black"
             ]
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

     Item{
         anchors.top: layout.bottom
         anchors.topMargin: 10
         anchors.left: parent.left
         anchors.leftMargin: 10
         width: parent.width
         height: 20


         Text {
             id:tip
             anchors.left: parent.left
             anchors.bottom: sliderItem.bottom
             anchors.bottomMargin: 5
             font.pointSize:10
             font.bold: true
             text: qsTr("粗细: ")
         }



         Item{
             id:sliderItem
             anchors.left: tip.right
             anchors.leftMargin: 2
             anchors.verticalCenter: parent.verticalCenter
             width: parent.width/2
             height: parent.height
             Slider{
                anchors.fill: parent
                from: 1
                value: 1
                to:10

                onMoved: {
                    canvas.lineWidth = value
                }
             }
         }
     }
}
