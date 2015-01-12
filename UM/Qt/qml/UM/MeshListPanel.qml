import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.1
import QtQuick.Controls.Styles 1.1

import UM 1.0 as UM

Panel {
    title: "Layers"

    contents: ColumnLayout 
    {
        Layout.preferredWidth: 200
        Layout.preferredHeight: 400

        ListView
        {
            Layout.fillWidth: true
            Layout.fillHeight: true
            id:meshList
            //headerVisible: false
            //TableViewColumn{ role: "name" ; title: "Name" ; width: 200 }
            delegate: meshDelegate      
            model: UM.Models.meshListModel
        }

    }
    Component 
    {
        id: meshDelegate
       
                
        Rectangle 
        {
            color: model.selected ?"#2EB5E7": "#EBEBEB" 
            width:200
            height:25
            MouseArea
            {
                anchors.fill: parent;
                onClicked: meshList.model.setSelected(model.key)
            }
            RowLayout 
            {
                CheckBox 
                {
                    checked: model.visibility
                    implicitWidth: 25
                    onClicked: meshList.model.setVisibility(model.key, checked)
                }
                Text 
                {
                    text:model.name
                }
                
            }
            
            
        }
    }
}
