import QtQuick 1.1
import com.nokia.meego 1.0




PageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage {
        id: mainPage
    }

    /*
    Component.onCompleted: {
        pageStack.push(Qt.resolvedUrl("ShowServerListWindow.qml"))
    }



    ToolBarLayout {
        id: commonTools
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
              pageStack.push(Qt.resolvedUrl("ShowServerListWindow.qml"))
          }
        }

        ToolIcon {
            platformIconId: "icon-m-toolbar-mediacontrol-play"
          onClicked: {
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
*/

}
