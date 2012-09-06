/****************************************************************************
** Meta object code from reading C++ file 'translation.h'
**
** Created: Wed 5. Sep 17:37:36 2012
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../translation.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'translation.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Translation[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: signature, parameters, type, tag, flags
      25,   21,   13,   12, 0x02,
      42,   21,   13,   12, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_Translation[] = {
    "Translation\0\0QString\0tag\0getQStr(QString)\0"
    "getQStr(int)\0"
};

const QMetaObject Translation::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Translation,
      qt_meta_data_Translation, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Translation::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Translation::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Translation::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Translation))
        return static_cast<void*>(const_cast< Translation*>(this));
    return QObject::qt_metacast(_clname);
}

int Translation::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: { QString _r = getQStr((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 1: { QString _r = getQStr((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        default: ;
        }
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
