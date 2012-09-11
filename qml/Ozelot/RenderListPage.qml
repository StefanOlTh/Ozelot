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
    id: renderListPage

    tools: myToolBar



    HeaderBar {
        id:myHeaderBar
        refreshableVisible: false
        busyVisible: false
        title: Translation.getString("Renders")
    }

    ToolBarStandard {
        id: myToolBar
        exitVisible: true
        mediaListVisible: true
        mediaControlVisible: false
        settingMenuVisible: true
        onClicked: (mySettingMenu.status === DialogStatus.Closed) ? mySettingMenu.open() : mySettingMenu.close()
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
