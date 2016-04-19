#ifndef GEOPOSITING_H
#define GEOPOSITING_H

#include <QObject>
#include <QGeoPositionInfo>

class geoPositing : public QObject
{
        Q_OBJECT
public:
    explicit geoPositing(QObject *parent = 0);

public slots:
    void positionUpdated(const QGeoPositionInfo &info);

signals:
    void offsetChange(int offset);
};

#endif // GEOPOSITING_H
