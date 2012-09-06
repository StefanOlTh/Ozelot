#ifndef TRANSLATION_H
#define TRANSLATION_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QtXml/QXmlDefaultHandler>
#include <QLibraryInfo>

typedef struct
{
    long id;
    QString tag;
    QString body;
} TranslationTypeDef;



class LanguageSaxParser : public QXmlDefaultHandler
{

public:
    QString LanguageID;
    QString LanguageVersion;
    QString Author;
    QString CreateDate;

    bool startDocument();
    bool startElement( const QString&, const QString&, const QString &qname, const QXmlAttributes &attrs );
    bool endElement( const QString&, const QString&, const QString &qname );
    bool characters(const QString &str);

    bool setTranslationList(QList<TranslationTypeDef> *list);

private:
    enum MyStateType { NOTHING, LANGUAGE, AUTHOR, DATE, ITEM, BODY, COMMENT };
    enum MyStateType myState;

    TranslationTypeDef  *currDef;
    QList<TranslationTypeDef> *translationList;
};


class Translation : public QObject
{
public:
    static QList<TranslationTypeDef> translationList;

private:
    LanguageSaxParser handler;
    QString currLanguage;

    Q_OBJECT
public:
    explicit Translation(QObject *parent = 0);


    Q_INVOKABLE QString getString(QString tag)
    {
        QString result = "";

        return result;
    }

    Q_INVOKABLE QString getString(int tag)
    {
        QString result = "";

        return result;
    }


    //
    //
    Q_INVOKABLE QString getLanguage()
    {
        return currLanguage;
    }
    //
    //
    Q_INVOKABLE QString setLanguage(QString lang)
    {
        QString directory;
        QString path;
        QFile file;


        directory = ":/translation/";
        path = directory + "language_" + lang + ".xml";
        file.setFileName(path);

        if (!file.exists())
        {
            if (lang.indexOf("_") > -1)
            {
                QStringList list1 = lang.split("_", QString::SkipEmptyParts);

                lang = list1[0];
                path = directory + "language_" + lang + ".xml";
                file.setFileName(path);

                if (!file.exists())
                {
                    lang = "";
                    path = directory + "language.xml";
                    file.setFileName(path);
                }
            }
        }
        //
        // Check if the path to the final file exists
        //
        if (file.exists())
        {
            currLanguage = lang;

            handler.setTranslationList(&Translation.translationList);

            QXmlInputSource *source = new QXmlInputSource(&file);
            QXmlSimpleReader reader;
            reader.setContentHandler( &handler );

            reader.parse( source );
        }
        return currLanguage;
    }
    //
    //
    //
    bool setNewTag(long id, QString tag, QString body)
    {
        return true;
    }


signals:

public slots:

};



#endif // TRANSLATION_H
