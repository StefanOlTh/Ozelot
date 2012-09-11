
#include <QTextStream>
#include "logfile.h"


static QTemporaryFile logFile;


LogFile::LogFile(QObject *parent) :
    QObject(parent)
{
}

void LogFile::addString(QString logText)
{
    if (!logFile.exists()) {
        logFile.setAutoRemove(true);
        logFile.open();
    }
    //
    //
    if (logFile.exists()) {
        QTextStream textOut(&logFile);

        textOut << logText;
        logFile.flush();
    }
}

