#ifndef MQTTTEST_H
#define MQTTTEST_H

#include <QWidget>
#include <QDialog>

namespace Ui {
class MQTTTest;
}

class MQTTTest : public QDialog
{
    Q_OBJECT

public:
    explicit MQTTTest(QDialog *parent = 0);
    ~MQTTTest();

private slots:

    void on_Connect_clicked();

    void on_Publish_clicked();

private:
    Ui::MQTTTest *ui;
};

#endif // MQTTTEST_H
