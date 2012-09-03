// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0


Page {
    id: myAboutPage

    tools: myAboutPageToolBar


    onVisibleChanged: {
             if (visible) {
            }
    }


    Label {
        id: label
        anchors.centerIn: parent
        text: qsTr("About")
        visible: true
    }


    ToolBarLayout {
        id: myAboutPageToolBar
        visible: true

        ToolIcon {
            platformIconId: "icon-m-toolbar-back"
            anchors.left: (parent === undefined) ? undefined : parent.left
          onClicked: {
              pageStack.pop()
          }
        }

        ToolIcon {
            platformIconId: "icon-m-toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
          onClicked: {
              pageStack.push(Qt.resolvedUrl("ShowChangeLogPage.qml"))
          }
        }

    }
}
