import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import DarkStyle.Controls 1.0
import DarkStyle 1.0
import "../delegates"

Rectangle {

    color: Style.window.color.normal

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 10
        Button {
            text: "Open new location..."
            iconSource: "qrc:///images/plus.svg"
            onClicked: openProjectDialog()
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: Style.window.color.dark
        }
        GridView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: _application.projects
            cellWidth: 140
            cellHeight: 150
            clip: true
            delegate: ProjectDelegate {
                width: GridView.view.cellWidth
                height: GridView.view.cellHeight
            }
        }
        Item { // spacer
            Layout.preferredHeight: 20
            visible: _application.featured.count > 0
        }
        Text {
            text: "Featured projects:"
            visible: _application.featured.count > 0
        }
        ListView {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height*0.25
            visible: count > 0
            model: _application.featured
            spacing: 1
            clip: true
            delegate: FeaturedProjectDelegate {
                width: parent.width
                height: 30
            }
        }
    }
}