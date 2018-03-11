import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3

Window {
    visible: true
    width: 130
    height: 100
    title: qsTr("Main Window")
    
    Button {
        id: button
        x: 13
        y: 51
        text: qsTr("Click me")
        onClicked: mainWindow.btnClicked()
    }
    
    Label {
        id: label
        x: 13
        y: 20
        width: 101
        height: 16
        text: mainWindow.labelText
    }
}