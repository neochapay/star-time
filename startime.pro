TEMPLATE = app

QT += qml quick positioning
CONFIG += c++11

SOURCES += main.cpp \
    src/geopositing.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    img/icon.png \
    img/icon175x175.png \
    img/icon500x1024.png \
    img/icon512x512.png

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

HEADERS += \
    src/geopositing.h
