#ifndef LOGFILE_H
#define LOGFILE_H

#include <QObject>
#include <QTemporaryFile>

class LogFile : public QObject
{
    Q_OBJECT
public:
    explicit LogFile(QObject *parent = 0);
    

signals:
    
public slots:


public:
    static void addString(QString logText);


};

#endif // LOGFILE_H
