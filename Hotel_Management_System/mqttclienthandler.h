#ifndef MQTTCLIENTHANDLER_H
#define MQTTCLIENTHANDLER_H

#include <QtMqtt/qmqttclient.h>
#include <QObject>
#include <QMessageBox>


class MQTTClientHandler : public QObject {
    Q_OBJECT

public:
    static MQTTClientHandler& instance();
    virtual ~MQTTClientHandler();

    void connectToMqttBroker();
    void sendMessage(const QString &topic, const QByteArray &message);

    // 添加设置消息参数的函数
       void setTopic(const QString &topic);
       void setMessage(const QByteArray &message);

       bool isConnected() const;

signals:
    void messageReceived(const QByteArray &message, const QMqttTopicName &topic);

private:
    MQTTClientHandler(QObject *parent = nullptr);
    MQTTClientHandler(const MQTTClientHandler&) = delete;
    MQTTClientHandler& operator=(const MQTTClientHandler&) = delete;

    void onConnected();
    void onDisconnected();
    void onMessageReceived(const QByteArray &message, const QMqttTopicName &topic);

    QMqttClient *m_client;
    static MQTTClientHandler *m_instance; // 声明静态成员变量

    QString m_topic;
    QByteArray m_message;
};

#endif // MQTTCLIENTHANDLER_H
