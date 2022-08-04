import QtQuick 2.0
import QtQuick.Controls 2.0

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
    property int _w: parent.width
    property bool isPen:true

    spacing: _w*0.01;


    Repeater
    {
        //四个colorSquare
        model: ["black","#33B5E5", "#99CC00", "#FFBB33", "#FF4444"]//modelData 颜色数据
        ColorSquare
        {
            id:red;
            length: colorTools._w*0.05
            color: modelData;
            active: parent.isPen && parent.paintColor === color//当选中一个colorSquare时，当前画笔颜色为选中的颜色
            onClicked:
            {
                parent.paintColor = color
                parent.isPen = true
            }
        }
    }

    ColorChangedImage{
        imageSource:"qrc:/resource/resource/eraser.svg"
        imageWidth:colorTools._w*0.05
        imageHeight:colorTools._w*0.05
        imageColor:colorTools.isPen?"black":"#37e5df"
        MouseArea{
            anchors.fill: parent
            onClicked:{
                    colorTools.isPen = false
            }
        }
    }
}
