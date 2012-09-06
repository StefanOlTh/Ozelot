#ifndef TRANSLATION_H
#define TRANSLATION_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QtXml>


typedef struct
{
    QString id;
    QString value;
    QString comment;
} TranslationTypeDef;



class AdSaxParser : public QXmlDefaultHandler
{
public:
  bool startDocument()
  {
    inAdBook = false;
    return true;
  }
  bool endElement( const QString&, const QString&, const QString &name )
  {
    if( name == "adbook" )
      inAdBook = false;

    return true;
  }

  bool startElement( const QString&, const QString&, const QString &name, const QXmlAttributes &attrs )
  {
/*
    if( inAdBook && name == "contact" )
    {
      QString name, phone, email;

      for( int i=0; i<attrs.count(); i++ )
      {
        if( attrs.localName( i ) == "name" )
          name = attrs.value( i );
        else if( attrs.localName( i ) == "phone" )
          phone = attrs.value( i );
        else if( attrs.localName( i ) == "email" )
          email = attrs.value( i );
      }

      QMessageBox::information( 0, "Contact", name + "\n" + phone + "\n" + email );
    }
    else if( name == "adbook" )
      inAdBook = true;
*/
    return true;
  }

private:
  bool inAdBook;
};


class Translation : public QObject
{
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
    static void setLanguage(QString HomePath, QString lang)
    {
        QFile file;


        currLanguage = lang;

        file.setFileName(HomePath + "/translation" + lang + ".xml");

        if (!file.exists())
        {
            file.setFileName(HomePath + "/translation.xml");

            if (!file.exists())
            {
                return;
            }
        }
        //
        //
        if (file.exists())
        {
            QXmlInputSource *source = new QXmlInputSource(&file);

            QXmlSimpleReader reader;
            reader.setContentHandler( &handler );

            reader.parse( source );
        }

    }

private:
    static  AdSaxParser handler;
    static QString currLanguage;
    static QList<TranslationTypeDef> translationList;

signals:
    
public slots:
    
};



#endif // TRANSLATION_H
