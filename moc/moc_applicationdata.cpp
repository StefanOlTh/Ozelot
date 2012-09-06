/****************************************************************************
** Meta object code from reading C++ file 'applicationdata.h'
**
** Created: Wed 5. Sep 19:17:11 2012
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../applicationdata.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'applicationdata.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ApplicationData[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: signature, parameters, type, tag, flags
      34,   25,   17,   16, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_ApplicationData[] = {
    "ApplicationData\0\0QString\0fileName\0"
    "getFileContent(QString)\0"
};

const QMetaObject ApplicationData::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ApplicationData,
      qt_meta_data_ApplicationData, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ApplicationData::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ApplicationData::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ApplicationData::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ApplicationData))
        return static_cast<void*>(const_cast< ApplicationData*>(this));
    return QObject::qt_metacast(_clname);
}

int ApplicationData::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: { QString _r = getFileContent((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        default: ;
        }
        _id -= 1;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
