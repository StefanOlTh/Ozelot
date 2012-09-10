// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1


Menu {
    id: settingMenuStandard
    visualParent: pageStack
    MenuLayout {
        MenuItem { text: Translation.getString("Settings") }
        MenuItem {
            text: Translation.getString("About")
            onClicked: pageStack.push(Qt.resolvedUrl("../AboutPage.qml"))
        }
    }
}
