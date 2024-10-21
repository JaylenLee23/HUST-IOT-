/********************************************************************************
** Form generated from reading UI file 'mqtttest.ui'
**
** Created by: Qt User Interface Compiler version 5.9.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MQTTTEST_H
#define UI_MQTTTEST_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTextBrowser>
#include <QtWidgets/QTextEdit>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MQTTTest
{
public:
    QPushButton *Connect;
    QPushButton *Publish;
    QTextEdit *textEdit;
    QLabel *label;
    QTextBrowser *textBrowser;
    QLabel *label_2;

    void setupUi(QWidget *MQTTTest)
    {
        if (MQTTTest->objectName().isEmpty())
            MQTTTest->setObjectName(QStringLiteral("MQTTTest"));
        MQTTTest->resize(559, 493);
        Connect = new QPushButton(MQTTTest);
        Connect->setObjectName(QStringLiteral("Connect"));
        Connect->setGeometry(QRect(230, 4, 101, 31));
        Publish = new QPushButton(MQTTTest);
        Publish->setObjectName(QStringLiteral("Publish"));
        Publish->setGeometry(QRect(180, 260, 171, 51));
        textEdit = new QTextEdit(MQTTTest);
        textEdit->setObjectName(QStringLiteral("textEdit"));
        textEdit->setGeometry(QRect(30, 130, 451, 121));
        label = new QLabel(MQTTTest);
        label->setObjectName(QStringLiteral("label"));
        label->setGeometry(QRect(10, 90, 121, 61));
        textBrowser = new QTextBrowser(MQTTTest);
        textBrowser->setObjectName(QStringLiteral("textBrowser"));
        textBrowser->setGeometry(QRect(90, 50, 391, 41));
        label_2 = new QLabel(MQTTTest);
        label_2->setObjectName(QStringLiteral("label_2"));
        label_2->setGeometry(QRect(10, 45, 71, 41));

        retranslateUi(MQTTTest);

        QMetaObject::connectSlotsByName(MQTTTest);
    } // setupUi

    void retranslateUi(QWidget *MQTTTest)
    {
        MQTTTest->setWindowTitle(QApplication::translate("MQTTTest", "Form", Q_NULLPTR));
        Connect->setText(QApplication::translate("MQTTTest", "\350\277\236\346\216\245", Q_NULLPTR));
        Publish->setText(QApplication::translate("MQTTTest", "\345\217\221\345\270\203", Q_NULLPTR));
        label->setText(QApplication::translate("MQTTTest", "\350\276\223\345\205\245\345\217\221\345\270\203\347\232\204\346\266\210\346\201\257(json):", Q_NULLPTR));
        label_2->setText(QApplication::translate("MQTTTest", "\350\277\236\346\216\245\347\212\266\346\200\201\357\274\232", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class MQTTTest: public Ui_MQTTTest {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MQTTTEST_H
