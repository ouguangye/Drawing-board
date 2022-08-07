import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Row
{
    id:colorTools//颜色提取工具
    anchors
    {
        horizontalCenter: parent.horizontalCenter
        top: parent.top
        topMargin: 8
    }

    property color paintColor: "black"//设置初始画笔颜色
    //property int _w: parent.width
    property bool isPen:true
    property double _iconSize: parent.width*0.05
    spacing: parent.width*0.2;



    /*
    Repeater
    {
        //四个colorSquare
        model: ["black","#33B5E5", "#99CC00", "#FFBB33", "#FF4444"]//modelData 颜色数据
        ColorSquare
        {
            id:red;
            length: _iconSize
            color: modelData;
            active: parent.isPen && parent.paintColor === color//当选中一个colorSquare时，当前画笔颜色为选中的颜色
            onClicked:
            {
                parent.paintColor = color
                parent.isPen = true
            }
        }
    }
    */


    Item{
        width:_iconSize
        height: _iconSize
        ColorChangedImage{
            id:ink
            imageSource:"qrc:/resource/resource/ink.svg"
            imageWidth:parent.width
            imageHeight:parent.height
            imageColor:colorTools.isPen?"black":"#37e5df"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    popup.open()
                }
            }
        }

        Popup {
             id: popup
             width: 200
             height: 300
             x: ink.width-width/2
             y: ink.height
             modal: true
             focus: true
             closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        }

    }




    ColorChangedImage{
        imageSource:"qrc:/resource/resource/eraser.svg"
        imageWidth:_iconSize
        imageHeight:_iconSize
        imageColor:colorTools.isPen?"black":"#37e5df"
        MouseArea{
            anchors.fill: parent
            onClicked:{
                    colorTools.isPen = false
            }
        }
    }


//    Item{
//        width: _iconSize
//        height: _iconSize
//        Image{
//            source:"qrc:/resource/resource/clear.svg"
//            width:parent.width
//            height:parent.height

//            property bool hover: false

//            ToolTip {
//                parent: parent
//                visible: parent.hover
//                text: "清空画布"
//            }

//            MouseArea{
//                anchors.fill: parent
//                hoverEnabled: true

//                onClicked:{
//                    id_mesDialog.open()
//                }

//                onEntered:
//                {
//                    parent.hover = true
//                }

//                onExited:
//                {
//                    parent.hover = false
//                }
//            }
//        }

//        MessageDialog {
//            id:id_mesDialog
//            title: "警告"
//            icon: StandardIcon.Warning
//            text: "确定清除画布?"
//            standardButtons: StandardButton.Yes |StandardButton.No
//            Component.onCompleted: visible = false
//            onYes: canvas.clearMyCanvas();
//        }
//    }

    ClearIcon{
        myWidth: parent._iconSize
        myHeight: parent._iconSize
    }
}
