/*!
 * This file is part of the Ozelot application
 *
 * This file is distributed WITHOUT ANY WARRANTY;
 * without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
*/
// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0

import "./component"

Page {
    id: serverListPage

    tools: myToolBar

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


    HeaderBar {
        refreshableVisible: false
        busyVisible: false
        title: Translation.getString("Servers")
    }

    ToolBarStandard {
        id: myToolBar
        exitVisible: true
        mediaControlVisible: true
        settingMenuVisible: true
        onClicked: (mySettingMenu.status === DialogStatus.Closed) ? mySettingMenu.open() : mySettingMenu.close()
    }

    Menu {
        id: mySettingMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: Translation.getString("Settings") }
            MenuItem { text: Translation.getString("Help") }
            MenuItem {
                text: Translation.getString("About")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        }
    }
}
