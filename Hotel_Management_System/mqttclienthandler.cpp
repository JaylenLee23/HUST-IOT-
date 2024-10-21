// MQTTClientHandler.cpp
#include "MQTTClientHandler.h"
#include <QCoreApplication>
#include <QMessageBox>

// 定义静态成员变量
MQTTClientHandler *MQTTClientHandler::m_instance = nullptr;

// 私有构造函数
MQTTClientHandler::MQTTClientHandler(QObject *parent) : QObject(parent) {
    m_client = new QMqttClient(this);
    connect(m_client, &QMqttClient::connected, this, &MQTTClientHandler::onConnected);

    connect(m_client, &QMqttClient::disconnected, this, &MQTTClientHandler::onDisconnected);
    connect(m_client, &QMqttClient::messageReceived, this, &MQTTClientHandler::onMessageReceived);
}

// 公共析构函数
MQTTClientHandler::~MQTTClientHandler() {
    // 清理资源，例如断开连接
    if (m_client->state() == QMqttClient::Connected) {
        m_client->disconnectFromHost();
    }
    delete m_client;
}

// 静态方法，用于获取单例实例
MQTTClientHandler& MQTTClientHandler::instance() {
    if (m_instance == nullptr) {
        m_instance = new MQTTClientHandler();
    }
    return *m_instance;
}

// 连接到MQTT代理
void MQTTClientHandler::connectToMqttBroker() {
    m_client->setHostname("121.199.31.186");
    m_client->setPort(1883);
    m_client->connectToHost();
}

// 发送消息到MQTT代理
void MQTTClientHandler::sendMessage(const QString &topic, const QByteArray &message) {
    if (m_client->state() == QMqttClient::Connected) {
        m_client->publish(topic, message);
        qDebug()<<"MQTT: publish.";
    } else {
        QMessageBox::warning(nullptr, "MQTT", "Not connected to MQTT broker.");
    }
}

// 处理连接成功的信号
void MQTTClientHandler::onConnected() {
    qDebug() << "MQTT: Connected to broker.";

    // 订阅主题
    //m_client->subscribe("test/topic", 0);

    if (!m_topic.isEmpty() && !m_message.isEmpty()) {
            sendMessage(m_topic, m_message);
    }
}

// 处理断开连接的信号
void MQTTClientHandler::onDisconnected() {
    qDebug() << "MQTT: Disconnected from broker.";
}

// 处理接收到的消息
void MQTTClientHandler::onMessageReceived(const QByteArray &message, const QMqttTopicName &topic) {
    // Handle received message
}

// 实现设置消息参数的函数
void MQTTClientHandler::setTopic(const QString &topic) {
    m_topic = topic;
}

void MQTTClientHandler::setMessage(const QByteArray &message) {
    m_message = message;
}

bool MQTTClientHandler::isConnected() const {
    return m_client->state() == QMqttClient::Connected;
}
