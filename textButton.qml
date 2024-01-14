import QtQuick

Item {
    id: root

    property color color: "gray"
    property alias text: buttonText.text

    signal clicked()

    Rectangle{
        id: background

        anchors.fill: parent

        color: if (buttonMouseArea.containsPress) {
                    return Qt.darker(root.color)
               } else if (buttonMouseArea.containsMouse) {
                    return Qt.lighter(root.color)
               } else {
                    return root.color
               }
    }

    Text {
        id: buttonText

        anchors.centerIn: parent
    }

    MouseArea{
        id: buttonMouseArea

        anchors.fill: parent

        hoverEnabled: true

        onClicked: {
            root.clicked()
        }
    }
}
