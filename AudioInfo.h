#ifndef AUDIOINFO_H
#define AUDIOINFO_H

#include <QObject>
#include <QUrl>
// заголовочный файл для QML_ELEMENT
#include <qqml.h>

class AudioInfo : public QObject
{
    Q_OBJECT
    // для автоматической регистрации класса C++ с движком QML используем этот макрос
    QML_ELEMENT

    Q_PROPERTY(int songIndex READ songIndex WRITE setSongIndex NOTIFY songIndexChanged FINAL)
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged FINAL)
    Q_PROPERTY(QString authorName READ authorName WRITE setAuthorName NOTIFY authorNameChanged FINAL)
    Q_PROPERTY(QUrl imageSource READ imageSource WRITE setImageSource NOTIFY imageSourceChanged FINAL)
    Q_PROPERTY(QUrl videoSource READ videoSource WRITE setVideoSource NOTIFY videoSourceChanged FINAL)
    Q_PROPERTY(QUrl songSource READ songSource WRITE setSongSource NOTIFY songSourceChanged REQUIRED)

public:
    explicit AudioInfo(QObject *parent = nullptr);

    int songIndex() const;
    void setSongIndex(int newSongIndex);

    QString title() const;
    void setTitle(const QString &newTitle);

    QString authorName() const;
    void setAuthorName(const QString &newAuthorName);

    QUrl imageSource() const;
    void setImageSource(const QUrl &newImageSource);

    QUrl videoSource() const;
    void setVideoSource(const QUrl &newVideoSource);

    QUrl songSource() const;
    void setSongSource(const QUrl &newSongSource);

signals:
    void songIndexChanged();
    void titleChanged();

    void authorNameChanged();

    void imageSourceChanged();

    void videoSourceChanged();

    void songSourceChanged();

private:
    int m_songIndex;
    QString m_title;
    QString m_authorName;
    QUrl m_imageSource;
    QUrl m_videoSource;
    QUrl m_songSource;
};

#endif // AUDIOINFO_H
