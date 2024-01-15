#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include "PlayerController.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon(":/SongPlayer/assets/icons/app_icon.jpg"));

    QQmlApplicationEngine engine;

    // создаем обьект нашего контроллера в С++
    PlayerController *playerController = new PlayerController(&app);
    // Связываем наш контроллер с QML что бы функции контроллера были там доступны
    // Первый параметр это название нашего экземпляра в пространстве имен QML-движка, второй это versionMajor(Версия номер которой мы меняем при крупных изменениях),
    // третий это versionMinor(при мелких фиксах меняем эту версию), четвертый это то как будет называться наш экземпляр в QML, пятое это сам наш экземпляр из C++.
    qmlRegisterSingletonInstance("com.company.PlayerController", 1, 0, "PlayerController", playerController);

    const QUrl url(u"qrc:/Protify_analogue/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
