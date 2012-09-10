// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
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
