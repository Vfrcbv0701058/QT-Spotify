import QtQuick
import QtMultimedia
import com.company.PlayerController
import Protify_analogue

Item {
    id: root

    // создали провайдера данных из с++ класса и теперь все достаем с infoProvider
    readonly property AudioInfo infoProvider: AudioInfo {}

    visible: PlayerController.currentSongIndex === infoProvider.songIndex

    Image {
        id: albumImage

        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
        }

        width: 150
        height: 150

        source: infoProvider.imageSource
    }

    Video{
        id: albumVideo

        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
        }

        width: 150
        height: 150

        source: infoProvider.videoSource

        loops: MediaPlayer.Infinite
        volume: 0
    }

    Text{
        id: titleText

        anchors{
            bottom: parent.verticalCenter
            left: albumImage.right
            margins: 20
            right: parent.right
        }

        color: "white"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        text: infoProvider.title

        font{
        pixelSize: 20
        bold: true
        }
    }

    Text{
        id: authorName

        anchors{
            top: parent.verticalCenter
            left: titleText.left
            topMargin: 5
            right: parent.right
        }

        color: "gray"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        text: infoProvider.authorName

        font{
            pixelSize: 16
        }
    }

    onVisibleChanged: {
        if(visible){
            albumVideo.play()
            PlayerController.changeAudioSource(infoProvider.songSource)
        } else {
            albumVideo.seek(0)
            albumVideo.stop()
        }
    }

    Component.onCompleted: {
        if (PlayerController.currentSongIndex === infoProvider.songIndex) {
            PlayerController.changeAudioSource(infoProvider.songSource)
        }
    }
}
