import QtQuick

Window {
    id: root

    width: 640
    height: 480

    visible: true

    title: qsTr("Song Player")

    Rectangle {
        id: topbar

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        height: 50
        color: "#5F8575"
    }

    Rectangle {
        id: mainSelection

        anchors {
            top: topbar.bottom
            right: parent.right
            left: parent.left
            bottom: bottombar.top
        }

        color: "#1E1E1E"

        AudioInfoiBox {
            id: firstSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 0
            title: "Eine Kleine Nachtmusik"
            authorName: "Wolfgang Amadeus Mozart"
            imageSource: "assets/images/song1.jpg"
        }


        AudioInfoiBox {
            id: secondSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 1
            title: "Symphone №5 "
            authorName: "Ludwig Van Beethoven"
            imageSource: "assets/images/song2.jpg"
        }


        AudioInfoiBox {
            id: thirdSong

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }

            songIndex: 2
            title: "Air on the G String"
            authorName: "Johann Sebastian Bach"
            imageSource: "assets/images/song3.jpg"
        }
    }

    Rectangle {
        id: bottombar

        anchors {
            bottom: parent.bottom
            right: parent.right
            left: parent.left
        }

        height: 100
        color: "#333333"

        Row{
            anchors.centerIn: parent

            spacing: 20

            ImageButton{
                id: previousButton

                width: 64
                height: 64

                source: "assets/icons/previous.png"

                onClicked: playerController.switchToPreviousSong()
            }

            ImageButton{
                id: playPauseButton

                width: 64
                height: 64

                source: playerController.playing ? "assets/icons/pause.png" : "assets/icons/play.png"

                onClicked: playerController.playPause()
            }

            ImageButton{
                id: nextButton

                width: 64
                height: 64

                source: "assets/icons/next.png"

                onClicked: playerController.switchToNextSong()
            }
        }
    }

    QtObject{
        id: playerController

        property int currentSongIndex: 0
        property int songCount: 3
        property bool playing: false

        function playPause(){
            playing = !playing
        }

        function switchToPreviousSong(){
            if (currentSongIndex > 0) {
                currentSongIndex--
            } else {
                currentSongIndex = songCount - 1
            }
        }

        function switchToNextSong() {
            if (currentSongIndex + 1 >= songCount) {
                currentSongIndex = 0
            } else {
                currentSongIndex++
            }
        }
    }
}
