// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: showServerListWindow

    tools: commonShowServerListTools

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
            text: Translation.getString("Renders")
            visible: true
        }
    }

    ToolBarLayout {
        id: commonShowServerListTools
        visible: true


        ToolIcon {
            platformIconId: "icon-m-toolbar-back"
            anchors.left: (parent === undefined) ? undefined : parent.left
            onClicked: {
                pageStack.push(Qt.resolvedUrl("ExitPage.qml"))
            }
        }


        ToolIcon {
            platformIconId: "icon-m-toolbar-directory"
            onClicked: {
                pageStack.push(Qt.resolvedUrl("MainPage.qml"))
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


    Label {
        id: label
        anchors.centerIn: parent
        text: qsTr("This is the render list")
    }
}
