#include "geopositing.h"

#include <QGeoPositionInfoSource>
#include <QDebug>

geoPositing::geoPositing(QObject *parent) :
    QObject(parent)
{
       QGeoPositionInfoSource *source = QGeoPositionInfoSource::createDefaultSource(0);
       source->setUpdateInterval(1000);
       connect(source, SIGNAL(positionUpdated(QGeoPositionInfo)), this, SLOT(positionUpdated(QGeoPositionInfo)));
       source->startUpdates();
}

void geoPositing::positionUpdated(const QGeoPositionInfo &info)
{
    QGeoCoordinate coord=info.coordinate();
    double lng, lat;
    lng = coord.longitude();
    lat  =coord.latitude();
    if(info.isValid())
    {
        double offset = lng*4*60;
        emit offsetChange(offset);

        qDebug() << "OFFSET:" << offset << " LNG:" << lat;
    }
    else
    {
        qDebug() << "Position error";
    }
}
