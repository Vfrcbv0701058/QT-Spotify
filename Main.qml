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
            imageColor: "red"
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
            imageColor: "yellow"
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
            imageColor: "purple"
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
    }

    QtObject{

    }
}
