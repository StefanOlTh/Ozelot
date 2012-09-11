#ifndef PLATFORMSYSTEMCALL_H
#define PLATFORMSYSTEMCALL_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QStringList>



class PlatformSystemCall : public QObject
{
    Q_OBJECT
public:
    explicit PlatformSystemCall(QObject *parent = 0);

    Q_INVOKABLE QString getFileNameTranslation(QString fileName, QString lang = "")
    {
        QFile f("");
        QString path = "";
        QString result = "";
        QString fileNameBase = "";
        QString fileNameEnding = "";



        if (fileName.length() < 1)
            return "";
        //
        QStringList list1 = fileName.split(QLatin1String("."), QString::SkipEmptyParts);
        //
        fileNameBase = fileName;
        if (list1.count() > 0) {
            fileNameBase = list1[0];
        }
        if (list1.count() > 1) {
            fileNameEnding = "." + list1[1];
        }
        //
        //
        fileNameBase = QLatin1String(":/") + fileNameBase;
        path = fileNameBase + fileNameEnding;
        //
        if (lang.length() > 0)
        {
            path = fileNameBase + QLatin1String("_") + lang + fileNameEnding;
            //
            f.setFileName(path);
            //
            if (!f.exists()) {
                QStringList list2 = lang.split(QLatin1String("_"), QString::SkipEmptyParts);
                //
                if (list2.count() > 0) {
                    path = fileNameBase + QLatin1String("_") + list2[0] + fileNameEnding;
                    //
                    f.setFileName(path);
                }
                //
                if (!f.exists()) {
                   path = fileNameBase + fileNameEnding;
                }
            }
        }
        //
        f.setFileName(path);
        QString s = "";
        //
        if (f.exists()) {
            if (f.open(QIODevice::ReadOnly | QIODevice::Text)) {
                try {
                    QTextStream in(&f);
                    in.setCodec("UTF-8");
                    result = in.readAll();
                }
                catch (std::exception& e ) {}

                f.close();
            }
        }
        //
        return result;
    } // Q_INVOKABLE QString getFileNameTranslation(QString fileName, QString lang = "")

signals:

public slots:

};

#endif // PLATFORMSYSTEMCALL_H
