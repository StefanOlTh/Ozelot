#include <QApplication>
#include <QDeclarativeView>
#include <QDeclarativeContext>
#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "applicationdata.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));


    QmlApplicationViewer viewer;

    viewer.rootContext()->setContextProperty("myApplicationData", new ApplicationData);

    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/Ozelot/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
