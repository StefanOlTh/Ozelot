// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0


Page {
    id: myAboutPage

    tools: myAboutPageToolBar

    Flickable  {
        id: flickable
        anchors.top: titleBackground.bottom
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

    Rectangle {
        id: titleBackground
        color: "blue"
        anchors.top: parent.top
        width: parent.width
        height: title.height * 2

        Label {
            id: title
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 35; font.bold: false
            color: "white"
            text: qsTr("About")
            visible: true
        }
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
