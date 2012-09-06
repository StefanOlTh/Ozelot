#ifndef TRANSLATION_H
#define TRANSLATION_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QtXml/QXmlDefaultHandler>
#include <QLibraryInfo>

typedef struct
{
    QString id;
    QString value;
    QString comment;
} TranslationTypeDef;



class AdSaxParser : public QXmlDefaultHandler
{
    enum MyStateType { NOTHING, LANGUAGE, AUTHOR, DATE, ITEM, BODY, COMMENT };


public:
    bool startDocument()
    {
        myState = NOTHING;
        return true;
    }
    bool endElement( const QString&, const QString&, const QString &qname )
    {
        if (qname == "language" &&  myState == LANGUAGE)
            myState = NOTHING;
        //
        else if (qname == "author" &&  myState == AUTHOR)
            myState = LANGUAGE;
        //
        else if (qname == "date" &&  myState == DATE)
            myState = LANGUAGE;
        //
        else if (qname == "item" &&  myState == ITEM)
            myState = LANGUAGE;
        //
        else if (qname == "body" &&  myState == BODY)
            myState = ITEM;
        //
        else if (qname == "comment" &&  myState == COMMENT)
            myState = ITEM;
        //
        else
            return false;
        //
        return true;
    }

    bool startElement( const QString&, const QString&, const QString &qname, const QXmlAttributes &attrs )
    {
        if (qname == "language" && myState == NOTHING)
        {
            //
            // Start of the language file
            // Get the two attributes 'id' and 'version'
            //
            LanguageID = attrs.value("id");
            LanguageVersion = attrs.value("version");
            //
            myState = LANGUAGE;
        }
        //
        else if (qname == "author" && myState == LANGUAGE)
            myState = AUTHOR;
        //
        else if (qname == "date" && myState == LANGUAGE)
            myState = DATE;
        //
        else if (qname == "item" && myState == LANGUAGE)
        {
            ItemID = attrs.value("tag").toLong();
            ItemTag = attrs.value("tag");
            myState = ITEM;
        }
        //
        else if (qname == "body" && myState == ITEM)
            myState = BODY;
        //
        else if (qname == "comment" && myState == ITEM)
            myState = COMMENT;
        //
        else
            return false;
        //
        return true;
    }



    bool characters(const QString &str)
    {
        switch(myState)
        {
        case AUTHOR:
            Author = str;
            break;

        case DATE:
            CreateDate = str;
            break;

        case BODY:
            break;

        case COMMENT: // Ignore this element
            break;

        case NOTHING:
        case LANGUAGE:
        case ITEM:
            break;
        }

        return true;
    }




public:
    QString LanguageID;
    QString LanguageVersion;
    QString Author;
    QString CreateDate;

private:
    enum MyStateType myState;
    long ItemID;
    QString ItemTag;
};


class Translation : public QObject
{

private:
    AdSaxParser handler;
    QString currLanguage;
    QList<TranslationTypeDef> translationList;

    Q_OBJECT
public:
    explicit Translation(QObject *parent = 0);


    Q_INVOKABLE QString getQStr(QString tag)
    {
        QString result = "";

        return result;
    }

    Q_INVOKABLE QString getQStr(int tag)
    {
        QString result = "";

        return result;
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

            QXmlInputSource *source = new QXmlInputSource(&file);

            QXmlSimpleReader reader;
            reader.setContentHandler( &handler );

            reader.parse( source );
        }
        return currLanguage;
    }


signals:

public slots:

};



#endif // TRANSLATION_H
