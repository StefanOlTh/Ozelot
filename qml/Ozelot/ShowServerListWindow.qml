// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: showServerListWindow

    tools: commonShowServerListTools

    ToolBarLayout {
        id: commonShowServerListTools
        visible: true

        ToolIcon {
            platformIconId: "icon-m-toolbar-back"
            anchors.left: (parent === undefined) ? undefined : parent.left
          onClicked: {
              pageStack.pop()
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


    Label {
        id: label
        anchors.centerIn: parent
        text: qsTr("This is the list")
    }
}
