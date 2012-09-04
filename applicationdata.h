#ifndef APPLICATIONDATA_H
#define APPLICATIONDATA_H

#include <QObject>
#include <QFile>
#include <QTextStream>

class ApplicationData : public QObject
{
    Q_OBJECT
public:
    explicit ApplicationData(QObject *parent = 0);
    
    Q_INVOKABLE QString getFileContent(QString fileName)
    {

        QFile f(fileName);
        QString result = "";

        if (f.open(QIODevice::ReadOnly | QIODevice::Text)) {
            try {
                QTextStream in(&f);
                in.setCodec("UTF-8");
                result = in.readAll();
            }
            catch (std::exception& e ) {}

            f.close();
        }

        return result;
    }

signals:
    
public slots:
    
};

#endif // APPLICATIONDATA_H
