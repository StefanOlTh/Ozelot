// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0




Page {
    id: myExitPage
    tools:myExitPageToolBar




    ToolBarLayout {
        id: myExitPageToolBar
        visible: true

        ToolIcon {
            platformIconId: "icon-m-invitation-accept"
            anchors.left: (parent === undefined) ? undefined : parent.left
          onClicked: {
              Qt.quit()
          }
        }


        ToolIcon {
            platformIconId: "icon-m-invitation-declined"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: {
                onClicked: pageStack.pop()
            }
        }
    }

    /*
    Component.onCompleted: {
        pageStack.push(Qt.resolvedUrl("MainPage.qml"))
    }
*/

    /*
    QueryDialog {
    id: errDialog
    titleText: "Exit application"
    message: "Exit?"
    acceptButtonText: "OK"
    rejectButtonText: "NO"
    accepted: {  Qt.quit() }
    rejected: {  pageStack.pop() }
    }
*/

}

