// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0


Rectangle {
    property alias title: title.text
    property alias refreshableVisible: refreshButton.visible
    property alias busyVisible: busyIndicator.visible


    id: headerBar
    color: "blue"
    anchors.top: parent.top
    width: parent.width
    height: 70

    signal clicked()

    Label {
        id: title
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 30; font.bold: false
        color: "white"
        text: ""
        visible: true
    }


    BusyIndicator {
        id: busyIndicator
        anchors.centerIn: refreshButton
        running: visible
    }

    ToolIcon {
        id: refreshButton
        platformIconId: "icon-m-common-refresh"
        anchors.right: (parent === undefined) ? undefined : parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        onClicked: headerBar.clicked()
    }

}
