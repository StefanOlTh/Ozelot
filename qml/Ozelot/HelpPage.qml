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
            width: screen.displayWidth
            font.pixelSize: 25
            textFormat: TextEdit.RichText
            wrapMode: TextEdit.WordWrap
            text: "<br>" + APPLICATION_NAME + " " + APPLICATION_VERSION + "<br>" +
                  myPlatformSystemCall.getFileNameTranslation("Help.txt", Translation.getLanguage());
            onLinkActivated: {
                if (link === "mailto:stefanthorlacius@live.se?log=y")
                    Qt.openUrlExternally(link)
                else
                    Qt.openUrlExternally(link)
                //
            }
        }
    }


    HeaderBar {
        id: myHeaderBar
        refreshableVisible: false
        busyVisible: false
        title: Translation.getString("Help")
    }

    ToolBarStandard {
        id: myToolBar
        mediaControlVisible: true
        mediaListVisible: true
    }
}
