#include "mqtttest.h"
#include "ui_mqtttest.h"
#include "mqttclienthandler.h"

MQTTTest::MQTTTest(QDialog *parent) :
    QDialog(parent),
    ui(new Ui::MQTTTest)
{
    ui->setupUi(this);
}

MQTTTest::~MQTTTest()
{
    delete ui;
}


void MQTTTest::on_Connect_clicked()
{

    MQTTClientHandler::instance().connectToMqttBroker();
    ui->textBrowser->append("已连接");

}

void MQTTTest::on_Publish_clicked()
{

    QString text = ui->textEdit->toPlainText();
    QByteArray message = text.toUtf8();
    MQTTClientHandler::instance().sendMessage("website",message);
}
