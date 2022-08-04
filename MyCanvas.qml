import QtQuick 2.0
import QtQuick.Controls 2.0

Canvas
{
    id:canvas;


    property color color: colorTools.paintColor

    property int lineWidth: 5

    //property alias color: "green"

    //鼠标点击坐标位置
    property real lastX
    property real lastY

    smooth: true

    anchors
    {
        left: parent.left;
        right:parent.right;
        top:colorTools.bottom;
        bottom: parent.bottom;
        margins: 8
    }

    onPaint:
    {
        var ctx = getContext("2d")
        if(colorTools.isPen){
            draw1(ctx)
        }
        else{
            erase(ctx)
        }

    }

    function draw1(ctx){
        ctx.lineWidth = canvas.lineWidth
        ctx.strokeStyle = canvas.color;
        ctx.beginPath()
        ctx.moveTo(lastX,lastY)
        lastX = area.mouseX;
        lastY = area.mouseY;
        ctx.lineTo(lastX,lastY)
        ctx.stroke()
    }

    function erase(ctx){
        ctx.clearRect(lastX-10,lastY-30,40,40)
        lastX = area.mouseX
        lastY = area.mouseY
    }


    MouseArea
    {
        id:area;
        anchors.fill: parent;
        cursorShape: Qt.BlankCursor     	//光标形状   BlankCursor隐藏系统光标
        hoverEnabled: true							//监测光标位置变化
        onPressed:
        {
            canvas.lastX = mouseX;
            canvas.lastY = mouseY;

        }
        onPositionChanged:
        {
            coustomCusor.x = mouseX - coustomCusor.width/4.5
            coustomCusor.y = mouseY - coustomCusor.height

            //console.log("y: "+ mouseY +" "+coustomCusor.y)

            if(pressed){
                canvas.requestPaint()//当鼠标press位置改变  完成当前绘制
            }
        }

    }

    ColorChangedImage{
        id: coustomCusor
        imageSource:colorTools.isPen?"qrc:/resource/resource/pen_cursor.svg":"qrc:/resource/resource/eraser.svg"
        imageWidth:24
        imageHeight:24
        imageColor:colorTools.isPen?colorTools.paintColor:"black"
        isVisible:area.mouseY >= 5
    }
}
