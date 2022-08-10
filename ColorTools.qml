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
    property bool isPen:true
    property double _iconSize: parent.width*0.03
    spacing: parent.width*0.2;

    InkIcon{
        length: _iconSize
    }

    MyPopup{
        id:myPopup
        myWidth: parent.width*0.4
        //myHeight: 300
        myX:- _iconSize-45
        myY:parent.height
        colorSize: _iconSize
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


    ClearIcon{
        myWidth: parent._iconSize
        myHeight: parent._iconSize
    }

}
