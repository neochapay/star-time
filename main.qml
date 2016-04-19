import QtQuick 2.4
import QtQuick.Window 2.2

import QtGraphicalEffects 1.0

import geoPositing 1.0

Window {
    id: main
    visible: true
    color: "black"

    property int offset: 0;

    GeoPositing{
        id: geoPositon
    }

    Text {
        id: timeText;
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: height/2
        font.bold: true
        z: 2
        width: parent.width-20
        height: parent.height/4
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
    }

    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(0, parent.height)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#FF5E3A" }
            GradientStop { position: 1.0; color: "#FF9104" }
        }
        z: 1
    }

    Timer {
        id: timer
        interval: 1000
        repeat: true
        running: true

        onTriggered:
        {
            if(main.offset != 0)
            {
                var date = Math.floor(Date.now()/1000);
                date = date+offset;

                timeText.text =  Qt.formatTime(new Date(date*1000).toISOString(),"hh:mm:ss")
            }
            else
            {
                timeText.text = "Где я?"
            }
        }
    }

    Connections{
        target: geoPositon;
        onOffsetChange: {
            main.offset = offset
        }
    }
}
