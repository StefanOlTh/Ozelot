// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0


Page {
    id: myShowChangeLogPage

    tools: myShowChangeLogPageToolBar



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
//            text: "1dslkjhfsldkjhflkdshflkash__AA__Adlfkhaslkd__BB__fhlhdsflkhaslfla__CC__shdflk\n1\n1\n1\n2\n1\n1\n1\n1\n1\n3\n1\n1\n1\n4\n1\n1\n1\n1\n5\n1\n1\n1\n6\n1\n1\n1\n7\n1\n1\n1\n8\n\n\n\n\n9"
            font.pixelSize: 25
            textFormat: TextEdit.RichText
            wrapMode: TextEdit.WordWrap


            Component.onCompleted: {
                var doc = new XMLHttpRequest();
                doc.onreadystatechange = function() {
                            if (doc.readyState === XMLHttpRequest.DONE) {
                                changeLogArea.text = changeLogArea.text + doc.responseText
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
*/
                            }
                        }
//                doc.open("GET", Qt.resolvedUrl("OzelotChangeLog.txt"))
                doc.open("GET", Qt.resolvedUrl("qrc:///OzelotChangeLog.txt"))
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
            text: Translation.getString("Change Log")
            visible: true
        }
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
              pageStack.push(Qt.resolvedUrl("MainPage.qml"))
          }
        }


        ToolIcon {
            platformIconId: "icon-m-toolbar-mediacontrol-play"
          onClicked: {
              pageStack.push(Qt.resolvedUrl("ShowServerListWindow.qml"))
          }
        }


    }
/*

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
