import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import Qt.labs.platform 1.0

Window {
    id: window
    visible: true
    width: 300
    height: 430
    title: mainWindow.title
    
    SystemTrayIcon {
        id: trayIcon
        visible: true
        iconSource: "qrc:/trayIcon.png"
        
        onActivated: {
            window.show()
            window.raise()
            window.requestActivate()
        }
    }
    
    GroupBox {
        id: groupBox
        height: 83
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 17
        anchors.left: parent.left
        anchors.leftMargin: 8
        title: qsTr("Size")
        
        Label {
            id: label
            text: qsTr("Width:")
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
        }
        
        TextField {
            id: tfW
            width: 50
            height: 40
            text: Number(window.width).toLocaleString()
            validator: IntValidator{}
            anchors.top: parent.top
            anchors.topMargin: -1
            anchors.left: parent.left
            anchors.leftMargin: 43
        }
        
        Label {
            id: label1
            text: qsTr("Height:")
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 99
        }
        
        TextField {
            id: tfH
            width: 50
            height: 40
            text: Number(window.height).toLocaleString()
            validator: IntValidator{}
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 146
        }
        
        Button {
            id: btnSetSize
            x: 205
            width: 46
            height: 40
            text: qsTr("Set")
            anchors.top: parent.top
            anchors.topMargin: -1
            anchors.right: parent.right
            anchors.rightMargin: 0
            onClicked: {
                window.width = Number.fromLocaleString(tfW.text)
                window.height = Number.fromLocaleString(tfH.text)
            }
        }
    }
    
    GroupBox {
        id: groupBox1
        height: 83
        anchors.right: parent.right
        anchors.rightMargin: 17
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 96
        title: qsTr("Position")
        
        Label {
            id: label2
            text: qsTr("Pos X:")
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
        }
        
        TextField {
            id: tfSetPosX
            width: 50
            height: 40
            text: Number(window.x).toLocaleString()
            validator: IntValidator{}
            anchors.left: parent.left
            anchors.leftMargin: 43
            anchors.top: parent.top
            anchors.topMargin: -1
        }
        
        Label {
            id: label3
            text: qsTr("Pos Y:")
            anchors.left: parent.left
            anchors.leftMargin: 99
            anchors.top: parent.top
            anchors.topMargin: 0
        }
        
        TextField {
            id: tfSetPosY
            width: 50
            height: 40
            text: Number(window.y).toLocaleString()
            validator: IntValidator{}
            anchors.top: parent.top
            anchors.topMargin: -1
            anchors.left: parent.left
            anchors.leftMargin: 138
        }
        
        Button {
            id: btnSetPos
            x: 194
            width: 57
            height: 40
            text: qsTr("Set")
            anchors.top: parent.top
            anchors.topMargin: -1
            anchors.right: parent.right
            anchors.rightMargin: 0
            onClicked: {
                window.x = Number.fromLocaleString(tfSetPosX.text)
                window.y = Number.fromLocaleString(tfSetPosY.text)
            }
        }
    }
    
    GroupBox {
        id: groupBox2
        height: 83
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.left: parent.left
        anchors.leftMargin: 9
        anchors.top: parent.top
        anchors.topMargin: 186
        title: qsTr("Tray Icon")
        
        Button {
            id: btnShowTrayIcon
            width: 118
            height: 40
            text: qsTr("Show")
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: -2
            onClicked: trayIcon.visible = true
        }
        
        Button {
            id: btnHideTrayIcon
            x: 133
            width: 118
            height: 40
            text: qsTr("Hide")
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            onClicked: trayIcon.visible = false
        }
    }
    
    GroupBox {
        id: groupBox3
        height: 83
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.left: parent.left
        anchors.leftMargin: 9
        anchors.top: parent.top
        anchors.topMargin: 275
        title: qsTr("Window State")
        
        Button {
            id: btnMinWnd
            width: 118
            height: 40
            text: qsTr("Minimize")
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: -2
            onClicked: window.showMinimized()
        }
        
        Button {
            id: btnMaxWnd
            x: 133
            width: 118
            height: 40
            text: qsTr("Maximize")
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: parent.top
            anchors.topMargin: -4
            onClicked: window.showMaximized()
        }
    }
    
    Button {
        id: btnClose
        x: 166
        y: 375
        width: 118
        height: 40
        text: qsTr("Close")
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        onClicked: Qt.quit()
    }
}