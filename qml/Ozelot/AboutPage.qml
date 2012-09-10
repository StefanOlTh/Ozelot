// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0

import "./component"

Page {
    id: myAboutPage

    tools: myToolBar

    Flickable  {
        id: flickable
        anchors.top: myHeaderBar.bottom
        anchors.bottom: parent.bottom
        boundsBehavior: Flickable.StopAtBounds
        width: parent.width;
        contentWidth: changeLogArea.width;
        contentHeight: changeLogArea.height

        Text  {

            id: changeLogArea
            font.pixelSize: 25
            textFormat: TextEdit.RichText
            wrapMode: TextEdit.WordWrap


            Component.onCompleted: {
                var doc = new XMLHttpRequest();
                doc.onreadystatechange = function() {
                            if (doc.readyState === XMLHttpRequest.DONE) {
                                changeLogArea.text = changeLogArea.text + doc.responseText
                            }
                        }
                doc.open("GET", Qt.resolvedUrl("qrc:///copyright.txt"))
                doc.send();
            }
            onLinkActivated: Qt.openUrlExternally(link)
        }
    }


    HeaderBar {
        id: myHeaderBar
        refreshableVisible: false
        busyVisible: false
        title: Translation.getString("About")
    }

    ToolBarStandard {
        id: myToolBar
        backVisible: false
        mediaControlVisible: true
        mediaListVisible: true
        viewMenuVisible: true
        onClicked: pageStack.push(Qt.resolvedUrl("ShowChangeLogPage.qml"))
    }
}

/*

    ToolBarLayout {
        id: myToolBar
        visible: true


        ToolIcon {
            platformIconId: "icon-m-toolbar-back"
            anchors.left: (parent === undefined) ? undefined : parent.left
            onClicked: {
                pageStack.pop()
            }
        }


        ToolIcon {
            platformIconId: "icon-m-toolbar-directory"
          onClicked: {
              pageStack.push(Qt.resolvedUrl("MainPage.qml"))
          }
        }


        ToolIcon {
            platformIconId: "icon-m-toolbar-mediacontrol-play"
          onClicked: {
              pageStack.push(Qt.resolvedUrl("ShowServerListWindow.qml"))
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
*/
