import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3

Window {
    visible: true
    width: 300
    height: 105
    title: qsTr("Main Window")
    
    Label {
        id: label
        x: 11
        y: 10
        text: qsTr("Selected date:")
    }
    
    Label {
        id: lblSelDate
        x: 102
        y: 10
        text: mainWindow.currentDate
    }
    
    Button {
        id: btnShowDialog
        x: 165
        y: 54
        width: 124
        height: 40
        text: qsTr("Show dialog")
        onClicked: mainWindow.btnShowDialogClicked()
    }
}