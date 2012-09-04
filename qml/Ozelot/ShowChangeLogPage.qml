// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0


Page {
    id: myShowChangeLogPage

    tools: myShowChangeLogPageToolBar


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
            text: qsTr("Change Log")
            visible: true
        }
    }




         TextEdit  {
            id: changeLogArea
            anchors.top: titleBackground.bottom
            width: parent.width
            height: 300
            text: "1\n1\n1\n1\n2\n1\n1\n1\n1\n1\n3\n1\n1\n1\n4\n1\n1\n1\n1\n5\n1\n1\n1\n6\n1\n1\n1\n7\n1\n1\n1\n8\n\n\n\n\n9"
            font.pixelSize: 20
            textFormat: TextEdit.AutoText
            readOnly: true
            wrapMode: TextEdit.WordWrap

    /*

            Component.onCompleted: {
                var doc = new XMLHttpRequest();
                doc.onreadystatechange = function() {
                    if (doc.readyState === XMLHttpRequest.DONE) {
                        changeLogArea.text = changeLogArea.text + doc.responseText + "\n\n"
    /*
                        var a = doc.responseXML.documentElement;
                        if (a !== null) {
                            for (var ii = 0; ii < a.childNodes.length; ++ii) {
                                if (a.childNodes[ii].nodeName === "body") {
                                    changeLogArea.text = changeLogArea.text + a.childNodes[ii].firstChild.nodeValue;
                                }
                            }
                        }
                    }
                }

                doc.open("GET", Qt.resolvedUrl("OzelotChangeLog.txt"))
                doc.send();
            }
    */
        }


    ToolBarLayout {
        id: myShowChangeLogPageToolBar
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
              pageStack.pop()
              pageStack.push(Qt.resolvedUrl("ShowServerListWindow.qml"))
          }
        }

        ToolIcon {
            platformIconId: "icon-m-toolbar-mediacontrol-play"
          onClicked: {
          }
        }

    }
}
