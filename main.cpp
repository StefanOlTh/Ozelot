#include <QApplication>
#include <QDeclarativeView>
#include <QDeclarativeContext>
#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "applicationdata.h"
#include "platformsystemcall.h"
#include "translation.h"
#include "version.h"


Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));


     QmlApplicationViewer viewer;
     Translation myTranslation;

     viewer.rootContext()->setContextProperty("myPlatformSystemCall", new PlatformSystemCall);
     viewer.rootContext()->setContextProperty("Translation", &myTranslation);
     viewer.rootContext()->setContextProperty("APPLICATION_VERSION", QLatin1String (APPLICATION_VERSION));
     viewer.rootContext()->setContextProperty("APPLICATION_NAME", QLatin1String (APPLICATION_NAME));

     myTranslation.setLanguage(QLocale::system().name());

     viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
     viewer.setMainQmlFile(QLatin1String("qml/Ozelot/main.qml"));
     viewer.showExpanded();

     return app->exec();
}
