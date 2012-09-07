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
    QString LanguageAuthor;
    QString LanguageCreateDate;

    //
    // Standard SAX parser callbacks
    //
    bool startDocument();
    bool startElement( const QString&, const QString&, const QString &qname, const QXmlAttributes &attrs );
    bool endElement( const QString&, const QString&, const QString &qname );
    bool characters(const QString &str);

    QList<TranslationTypeDef> translationList;

private:
    enum MyStateType { NOTHING, LANGUAGE, AUTHOR, DATE, ITEM, BODY, COMMENT };
    enum MyStateType myState;

    TranslationTypeDef  currDef;
}; // class LanguageSaxParser : public QXmlDefaultHandler


class Translation : public QObject
{

private:
    LanguageSaxParser handler;
    LanguageSaxParser defaultHandler;
    QString currLanguage;

    /*! If true, then the seach algoritm will always read language.xml regardsless of
      * prefferd language and search this file as fallback language
    */
    bool useFallBackLanguage;



    Q_OBJECT
public:
    explicit Translation(QObject *parent = 0);


    //! Returns the string corresponding to the tag
    /*!
      \param tag The tag to be searched for
      \param useTag If true then return the tag if the tag can not be found
      \return The string that correspond to the tag or, if paramter useTag is true, the tag
      */
    Q_INVOKABLE QString getString(QString tag, bool useTag = true)
    {
        for (int i = 0; i < handler.translationList.size(); ++i) {
            if (handler.translationList[i].tag == tag) {
                return handler.translationList[i].body;
            }
        }
        //
        if (useFallBackLanguage) {
            for (int i = 0; i < defaultHandler.translationList.size(); ++i) {
                if (defaultHandler.translationList[i].tag == tag) {
                    return defaultHandler.translationList[i].body;
                }
            }
        }
        //
        if (useTag)
            return tag;
        //
        return "";
    } // Q_INVOKABLE QString getString(QString tag)

    //! Returns the string corresponding to the tag
    /*!
      \param tag The tag to be searched for
      \param useTag If true then return the tag if the tag can not be found
      \return The string that correspond to the tag or, if paramter useTag is true, the tag
      */
    Q_INVOKABLE QString getString(int id)
    {
        for (int i = 0; i < handler.translationList.size(); ++i) {
            if (handler.translationList[i].id == id) {
                return handler.translationList[i].body;
            }
        }
        //
        if (useFallBackLanguage) {
            for (int i = 0; i < defaultHandler.translationList.size(); ++i) {
                if (defaultHandler.translationList[i].id == id) {
                    return defaultHandler.translationList[i].body;
                }
            }
        }
        //
        return "";
    } // Q_INVOKABLE QString getString(int tag)
    //
    //
    //
    //! Returns the current, if any, selected language
    /*!
      \return A string equal to the language
      */
    Q_INVOKABLE QString getLanguage()
    {
        if (handler.LanguageID.length() > 0)
            return handler.LanguageID;
        //
        return currLanguage;
        //
    } // Q_INVOKABLE QString getLanguage()
    //
    //
    //
    //! Returns the version, if any, of the current selected language
    /*!
      \return A string equal to the version
      */
    Q_INVOKABLE QString getLanguageVersion()
    {
        return handler.LanguageVersion;
        //
    } // Q_INVOKABLE QString getLanguage()
    //
    //
    //
    //! Returns the author, if any, of the current selected language
    /*!
      \return A string equal to the version
      */
    Q_INVOKABLE QString LanguageAuthor()
    {
        return handler.LanguageAuthor;
        //
    } // Q_INVOKABLE QString getLanguage()
    //
    //
    //
    //! Returns the author, if any, of the creation date of the selected language
    /*!
      \return A string equal to the creation date
      */
    Q_INVOKABLE QString LanguageCreateDate()
    {
        return handler.LanguageCreateDate;
        //
    } // Q_INVOKABLE QString LanguageCreateDate()
    //
    //
    //
    //! Sets the language of choice
    /*!
      \param lang The language code of desired language
      \return A string equal to the found language, empty if none was found
      */
    Q_INVOKABLE QString setLanguage(QString lang)
    {
        QString directory;
        QString path;
        QFile file;


        currLanguage = "";
        directory = ":/translation/";
        //
        path = directory + "language_" + lang + ".xml";
        file.setFileName(path);
        //
        if (!file.exists()) {
            if (lang.indexOf("_") > -1) {

                QStringList list1 = lang.split("_", QString::SkipEmptyParts);
                lang = list1[0];
                path = directory + "language_" + lang + ".xml";
                file.setFileName(path);
            }
        }
        //
        if (!file.exists()) {
            lang = "";
            path = directory + "language.xml";
            file.setFileName(path);
        }
        //
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
            //
            file.close();
        }
        //
        // Only use fall back language file if useFallBackLanguage == true and language.xml
        // have not already been loaded
        //
        if (useFallBackLanguage && lang != "") {
            path = directory + "language.xml";
            file.setFileName(path);
            //
            if (file.exists())
            {
                QXmlInputSource *source = new QXmlInputSource(&file);
                QXmlSimpleReader reader;
                reader.setContentHandler( &handler );

                reader.parse( source );

                file.close();
                //
            }
        }
        //
        //
        return currLanguage;
    } // Q_INVOKABLE QString setLanguage(QString lang)


signals:

public slots:

};



#endif // TRANSLATION_H
