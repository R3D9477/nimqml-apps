import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3

Window {
    visible: true
    width: 250
    height: 105
    title: qsTr("Main Window")

    TextField {
        id: textField
        x: 10
        y: 12
        width: 232
        height: 40
        text: mainWindow.messageText
    }

    Button {
        id: btnShowChildWnd
        x: 118
        y: 58
        width: 124
        height: 40
        text: qsTr("Show message")
        onClicked: mainWindow.showChildWindow()
    }
}
