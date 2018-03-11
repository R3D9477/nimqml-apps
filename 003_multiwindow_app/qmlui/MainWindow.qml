import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3

Window {
    id: window
    visible: true
    width: 250
    height: 105
    title: qsTr("Main Window")

    TextField {
        id: textField
        height: 40
        text: mainWindow.messageText
        anchors.top: parent.top
        anchors.topMargin: 12
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 10
        onTextEdited: mainWindow.messageText = textField.text
    }

    Button {
        id: btnShowChildWnd
        x: 118
        y: 58
        width: 124
        height: 40
        text: qsTr("Show message")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 7
        anchors.right: parent.right
        anchors.rightMargin: 8
        onClicked: mainWindow.showChildWindow()
    }
}
