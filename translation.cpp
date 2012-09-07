#include "translation.h"




//! Callbac from the SAX parser */
bool LanguageSaxParser::startDocument()
{
    myState = NOTHING;
    return true;
}

//! Callbac from the SAX parser */
bool LanguageSaxParser::endElement( const QString&, const QString&, const QString &qname )
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

//! Callbac from the SAX parser */
bool LanguageSaxParser::startElement( const QString&, const QString&, const QString &qname, const QXmlAttributes &attrs )
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
        currDef.id = attrs.value("id").toLong();
        currDef.tag = attrs.value("tag");
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



//! Callbac from the SAX parser */
bool LanguageSaxParser::characters(const QString &str)
{
    switch(myState)
    {
    case AUTHOR:
        LanguageAuthor = str;
        break;

    case DATE:
        LanguageCreateDate = str;
        break;

    case BODY:
        {
            currDef.body = str;
            translationList.append(currDef);
        }
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




Translation::Translation(QObject *parent) :
    QObject(parent)
{
    useFallBackLanguage = true;
    currLanguage = "";
}


