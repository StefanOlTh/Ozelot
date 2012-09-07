import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: mainPage

    tools: myMainTools

    Rectangle {
        id: titleBackground
        color: "blue"
        anchors.top: parent.top
        width: parent.width
        height: title.height

        Label {
            id: title
            anchors.left: parent.left
            font.pixelSize: 35; font.bold: false
            color: "white"
            text: Translation.getString("Servers")
            visible: true
        }
    }


    Label {
        id: label
        anchors.centerIn: parent
        text: Translation.getString("HelloWorld2")
        visible: false
    }

    Button {
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: label.bottom
            topMargin: 10
        }
        text: qsTr("Click here!")
        onClicked: label.visible = true
    }



    ToolBarLayout {
        id: myMainTools
        visible: true

        ToolIcon {
            platformIconId: "icon-m-toolbar-back"
            anchors.left: (parent === undefined) ? undefined : parent.left
          onClicked: {
              pageStack.push(Qt.resolvedUrl("ExitPage.qml"))
          }
        }

        ToolIcon {
            platformIconId: "icon-m-toolbar-mediacontrol-play"
          onClicked: {
              pageStack.push(Qt.resolvedUrl("ShowServerListWindow.qml"))
          }
        }

        ToolIcon {
            platformIconId: "icon-m-toolbar-settings"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (mySettingMenu.status === DialogStatus.Closed) ? mySettingMenu.open() : mySettingMenu.close()

        }
    }

    Menu {
        id: mySettingMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: Translation.getString("Settings") }
            MenuItem {
                text: Translation.getString("About")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        }
    }
}
