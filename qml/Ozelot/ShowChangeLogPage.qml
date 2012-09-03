// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0


Page {
    id: myShowChangeLogPage

    tools: myShowChangeLogPageToolBar

    onRotationChanged: {
        if ( screen.orientationString === "Portrait")
        {
            title.font.pixelSize = 55
        }
        else
        {
            title.font.pixelSize = 15
        }
    }

    onVisibleChanged: {
             if (visible) {
                 //changeLogArea.text = Qt.resolvedUrl("changelog");
                 // create component
//                 console.log("Page content created.");
//                 var object = componentDynamic.createObject(container);
//                 containerObject = object;
             }
    }



    Rectangle {
        id: titleBackground
        color: "blue"
        anchors.top: parent
        width: parent.width
        height: title.height
    }


    Label {
        id: title
        anchors.top: parent
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 35; font.bold: false
        color: "white"
        text: qsTr("Change Log")
        visible: true
    }

    ListView {
         id: list
         anchors.top: title.bottom
         width: parent.width
         highlight: highlight
         highlightFollowsCurrentItem: false
         focus: true

         Text {
             id: changeLogArea
             visible: true
             textFormat: Text.RichText
             anchors.top: title.bottom
             width: parent.width
             wrapMode: TextEdit.Wrap
             font.pixelSize: 20; font.bold: false
     //        text: ""
             text: qsTr("Change Log textd<br><a href=\"http://www.dn.se\">Nokia Qt DF</a><br><br>ksäksfäö<br>kgkhjslgjhlö<br>gfhlöfjglö<br>kjlökgas<br>klö<br>fjdasklö<br>djf<br>asj<br>fklöasjdf<br>klö<br>asjdf<br>klöasj<br>dfjd<br>aklö<br>sjdfklöasj<br>dfklöas<br>jdfk<br>löa<br>sjdfkl<br>öj<br>fa<br>sd<br>flökasjdflö<br>kasjdfaslödfjlöaksjdfl<br>ökasjoöjafdog<br>iöreoptopwerutq839u569+8n +t8wuq+tu<br>awreoptjcaoprtjcamvrtå0å0aåw0tmav4utmåwu4m åsetåpjgfdjoösfdjgopifdub9p8fdy4u39p åughuå0adlögjardopgjaorpgjaioprjegopiasjglökasfjdgklöjafdlökgjalöjkgalöskfjdlöaskjdölakgjaödgaölfjdfögaogha9pdfgypauöeorga")
         }
     }

/*
    Text {
        id: changeLogArea
        visible: true
        textFormat: Text.RichText
        anchors.top: title.bottom
        width: parent.width
        wrapMode: TextEdit.Wrap
        font.pixelSize: 20; font.bold: false
//        text: ""
        text: qsTr("Change Log textd<br><a href=\"http://www.dn.se\">Nokia Qt DF</a><br><br>ksäksfäö<br>kgkhjslgjhlö<br>gfhlöfjglö<br>kjlökgas<br>klö<br>fjdasklö<br>djf<br>asj<br>fklöasjdf<br>klö<br>asjdf<br>klöasj<br>dfjd<br>aklö<br>sjdfklöasj<br>dfklöas<br>jdfk<br>löa<br>sjdfkl<br>öj<br>fa<br>sd<br>flökasjdflö<br>kasjdfaslödfjlöaksjdflökasjoöjafdogiöreoptopwerutq839u569+8n +t8wuq+tuawreoptjcaoprtjcamvrtå0å0aåw0tmav4utmåwu4m åsetåpjgfdjoösfdjgopifdub9p8fdy4u39p åughuå0adlögjardopgjaorpgjaioprjegopiasjglökasfjdgklöjafdlökgjalöjkgalöskfjdlöaskjdölakgjaödgaölfjdfögaogha9pdfgypauöeorga")
    }
*/


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
