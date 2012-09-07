#include <QApplication>
#include <QDeclarativeView>
#include <QDeclarativeContext>
#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "applicationdata.h"
#include "translation.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));


     QmlApplicationViewer viewer;
     Translation myTranslation;

     viewer.rootContext()->setContextProperty("myApplicationData", new ApplicationData);
     viewer.rootContext()->setContextProperty("Translation", &myTranslation);

     myTranslation.setLanguage(QLocale::system().name());

     viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
     viewer.setMainQmlFile(QLatin1String("qml/Ozelot/main.qml"));
     viewer.showExpanded();

     return app->exec();
}
