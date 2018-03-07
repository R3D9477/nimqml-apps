import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3

Window {
    id: window
    visible: true
    width: 205
    height: 225
    title: qsTr("Main Window")

    TextField {
        id: tfExpr
        y: 24
        height: 40
        focus: true
        text: mainWindow.exprBuff
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 11
        horizontalAlignment: Text.AlignRight
        validator: RegExpValidator { regExp: /([+\-*\/.\(\)]|[0-9])+/ }
        Keys.onPressed: mainWindow.tfKeyPressed(event.key, event.text)
    }

    Button {
        id: btn1
        x: 10
        y: 70
        width: 32
        height: 32
        text: qsTr("1")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btn2
        x: 48
        y: 70
        width: 32
        height: 32
        text: qsTr("2")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btn3
        x: 86
        y: 70
        width: 32
        height: 32
        text: qsTr("3")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btn4
        x: 10
        y: 108
        width: 32
        height: 32
        text: qsTr("4")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btn5
        x: 48
        y: 108
        width: 32
        height: 32
        text: qsTr("5")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btn6
        x: 86
        y: 108
        width: 32
        height: 32
        text: qsTr("6")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btn7
        x: 10
        y: 146
        width: 32
        height: 32
        text: qsTr("7")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btn8
        x: 48
        y: 146
        width: 32
        height: 32
        text: qsTr("8")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btn9
        x: 86
        y: 146
        width: 32
        height: 32
        text: qsTr("9")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btn0
        x: 10
        y: 184
        width: 70
        height: 32
        text: qsTr("0")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btnDot
        x: 86
        y: 184
        width: 32
        height: 32
        text: qsTr(".")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btnDiv
        x: 124
        y: 70
        width: 32
        height: 32
        text: qsTr("/")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btnMult
        x: 124
        y: 108
        width: 32
        height: 32
        text: qsTr("*")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btnPlus
        x: 124
        y: 146
        width: 32
        height: 32
        text: qsTr("+")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btnMinus
        x: 124
        y: 184
        width: 32
        height: 32
        text: qsTr("-")
        onClicked: {
            mainWindow.btnActNumClicked(this.text);
            tfExpr.focus = true;
        }
    }

    Button {
        id: btnEval
        x: 162
        y: 108
        width: 32
        height: 108
        text: qsTr("=")
        onClicked: {
            mainWindow.btnEvalClicked();
            tfExpr.focus = true;
        }
    }

    Button {
        id: btnCancel
        x: 162
        y: 70
        width: 32
        height: 32
        text: qsTr("C")
        onClicked: {
            mainWindow.btnCancelClicked();
            tfExpr.focus = true;
        }
    }
}
