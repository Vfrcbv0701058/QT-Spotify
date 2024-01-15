#ifndef PLAYERCONTROLLER_H
#define PLAYERCONTROLLER_H

// добавили заголовок что бы работал проигрыватель песен
#include <QMediaPlayer>
#include <QObject>

class PlayerController : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int currentSongIndex READ currentSongIndex NOTIFY currentSongIndexChanged FINAL)
    Q_PROPERTY(int songCount READ songCount NOTIFY songCountChanged FINAL)
    Q_PROPERTY(bool playing READ playing NOTIFY playingChanged FINAL)
public:
    explicit PlayerController(QObject *parent = nullptr);

    int currentSongIndex() const;

    int songCount() const;

    bool playing() const;

    // Благодаря этому макросу функция switchToNextSong() будет доступна в QML
    Q_INVOKABLE void switchToNextSong();

    // второй способ сделать функции доступными в QML это засунуть их в публичные слоты
public slots:
    void switchToPreviousSong();
    void playPause();
    void changeAudioSource(const QUrl &source);

signals:
    void currentSongIndexChanged();
    void songCountChanged();
    void playingChanged();

private:
    int m_currentSongIndex = 0;
    int m_songCount = 3;
    bool m_playing = false;
    // добавили переменную проигрывателя
    QMediaPlayer m_mediaPlayer;
};

#endif // PLAYERCONTROLLER_H
