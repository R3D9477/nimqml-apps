import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3

Window {
    visible: true
    width: 250
    height: 100
    title: qsTr("Child Window")

    Label {
        id: label
        x: 13
        y: 12
        text: qsTr("Text:")
    }

    Label {
        id: lblText
        x: 46
        y: 12
        text: mainWindow.messageText
    }

    Button {
        id: btnClose
        x: 137
        y: 48
        text: qsTr("Close")
        onClicked: close()
    }
}
