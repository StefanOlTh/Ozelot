/*!
 * This file is part of the Ozelot application
 *
 * This file is distributed WITHOUT ANY WARRANTY;
 * without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
*/// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0

import "./component"


Page {
    id: myShowChangeLogPage

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



    HeaderBar {
        id:myHeaderBar
        refreshableVisible: false
        busyVisible: false
        title: Translation.getString("Change Log")
    }

    ToolBarStandard {
        id: myToolBar
        backVisible: true
        mediaListVisible: true
        mediaControlVisible: true
    }
}
