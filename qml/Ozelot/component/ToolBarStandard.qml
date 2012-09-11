// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1

import "../"

ToolBarLayout {
    property alias exitVisible: exit.visible
    property alias backVisible: back.visible
    property alias mediaListVisible: mediaList.visible
    property alias mediaControlVisible: mediaControl.visible
    property alias settingMenuVisible: settingMenu.visible
    property alias viewMenuVisible: viewMenu.visible

    property string clickType: ""

    id: toolBarStandard
    visible: true

    signal clicked()

    ToolIcon {
        id: exit
        visible: false
        platformIconId: "icon-m-toolbar-back"
        anchors.left: (parent === undefined) ? undefined : parent.left
        width: parent.width / 4
        onClicked: {
            pageStack.push(Qt.resolvedUrl("../ExitPage.qml"))
        }
    }

    ToolIcon {
        id: back
        visible: false
        platformIconId: "icon-m-toolbar-back"
        anchors.left: (parent === undefined) ? undefined : parent.left
        width: parent.width / 4
        onClicked: {
            pageStack.pop()
        }
    }


    ToolIcon {
        id: mediaList
        platformIconId: "icon-m-toolbar-directory"
        visible: false
        anchors.left: exit.right
        width: parent.width / 4
        onClicked: {
            pageStack.clear()
            pageStack.push(Qt.resolvedUrl("../MainPage.qml"))
        }
    }

    ToolIcon {
        id: mediaControl
        visible: false
        platformIconId: "icon-m-toolbar-mediacontrol-play"
        anchors.left: mediaList.right
        width: parent.width / 4
        onClicked: {
            pageStack.clear()
            pageStack.push(Qt.resolvedUrl("../RenderListPage.qml"))
        }
    }

    ToolIcon {
        id: settingMenu
        visible: false
        platformIconId: "icon-m-toolbar-settings"
        anchors.right: (parent === undefined) ? undefined : parent.right
        onClicked: {
            clickType = "settingMenu"
            toolBarStandard.clicked()
        }
    }

    ToolIcon {
        id: viewMenu
        visible: false
        platformIconId: "icon-m-toolbar-view-menu"
        anchors.right: (parent === undefined) ? undefined : parent.right
        onClicked: {
            clickType = "viewMenu"
            toolBarStandard.clicked()
        }
    }



     Component.onCompleted: {
        clickType = ""
    }
}
