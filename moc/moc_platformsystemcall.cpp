/****************************************************************************
** Meta object code from reading C++ file 'platformsystemcall.h'
**
** Created: Tue 11. Sep 13:53:54 2012
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../platformsystemcall.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'platformsystemcall.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_PlatformSystemCall[] = {

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
      42,   28,   20,   19, 0x02,
      91,   82,   20,   19, 0x22,

       0        // eod
};

static const char qt_meta_stringdata_PlatformSystemCall[] = {
    "PlatformSystemCall\0\0QString\0fileName,lang\0"
    "getFileNameTranslation(QString,QString)\0"
    "fileName\0getFileNameTranslation(QString)\0"
};

const QMetaObject PlatformSystemCall::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_PlatformSystemCall,
      qt_meta_data_PlatformSystemCall, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &PlatformSystemCall::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *PlatformSystemCall::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *PlatformSystemCall::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_PlatformSystemCall))
        return static_cast<void*>(const_cast< PlatformSystemCall*>(this));
    return QObject::qt_metacast(_clname);
}

int PlatformSystemCall::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: { QString _r = getFileNameTranslation((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 1: { QString _r = getFileNameTranslation((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        default: ;
        }
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
