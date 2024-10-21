import mysql.connector
import paho.mqtt.client as mqtt
import json

# MySQL 配置
mysql_config = {
    'user': 'root',
    'password': 'password',
    'host': 'localhost',
    'database': 'website'
}

# MQTT 配置
mqtt_broker = '121.199.31.186'  # 替换为你的 MQTT 代理地址
mqtt_topic = 'website'  # 替换为你的主题

# 连接到 MySQL 数据库
def connect_to_mysql():
    try:
        connection = mysql.connector.connect(**mysql_config)
        return connection
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None

# MQTT 消息回调
def on_message(client, userdata, message):
    print(f"Received message: {message.payload.decode()}")

    # 将消息解析为 JSON
    try:
        msg_json = json.loads(message.payload.decode())
        table_name = msg_json['tableName']
        data = msg_json['data']
    except (json.JSONDecodeError, KeyError) as e:
        print(f"Failed to parse message: {e}")
        return

    # 将数据保存到指定的 MySQL 数据库表
    connection = connect_to_mysql()
    if connection:
        try:
            with connection.cursor() as cursor:
                # 构建插入查询
                columns = ', '.join(data.keys())
                placeholders = ', '.join(['%s'] * len(data))
                insert_query = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
                cursor.execute(insert_query, tuple(data.values()))
                connection.commit()
                print(f"Message inserted into {table_name} successfully")
        except mysql.connector.Error as err:
            print(f"Failed to insert message: {err}")
        finally:
            connection.close()

# 设置 MQTT 客户端
client = mqtt.Client()
client.on_message = on_message

# 连接到 MQTT 代理并订阅主题
client.connect(mqtt_broker)
client.subscribe(mqtt_topic)

# 开始循环
client.loop_start()

try:
    print("Waiting for messages...")
    while True:
        pass
except KeyboardInterrupt:
    print("Exiting...")
finally:
    client.loop_stop()
    client.disconnect()
