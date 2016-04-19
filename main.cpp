#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDateTime>
#include <QQmlContext>
#include <QQuickItem>

#include "src/geopositing.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<geoPositing>("geoPositing",1,0,"GeoPositing");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
