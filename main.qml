import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

import QtQuick3D
import QtQuick3D.Helpers

Window {
    width: 1280
    height: 1024
    visible: true
    title: qsTr("Hello World")

    //    MouseArea {
    //        anchors.fill: parent
    //        onPositionChanged: {
    //            console.log( mouseX, mouseY ) // 320*381
    //            camera.position = Qt.vector3d(0 + (mouseX - 320), 200 + (mouseY - 381 ), 600)
    //        }
    //    }



    View3D {
        id: view
        anchors.fill: parent

        antialiasing: true

        // все нажатия клавиш отправляем на парсинг в отдельную функцию
//        Keys.onPressed: (event)=> { view.parseKeys( event ) };

        //! [environment]
        environment: SceneEnvironment {
            clearColor: "skyblue"
            backgroundMode: SceneEnvironment.Color

//             antialiasingMode: SceneEnvironment.SSAA
//             antialiasingQuality: SceneEnvironment.VeryHigh
        }
        //! [environment]

        //! [camera]
        PerspectiveCamera {
            id: camera
            position: Qt.vector3d(100, 100, 800)
        }
        //! [camera]

        //! [light]
        DirectionalLight {}
        //! [light]

        //! [objects]
        Model {
            id: whiteModel
            position: Qt.vector3d( 0, 0, 0 )
            source: "#Cylinder"
            scale: Qt.vector3d(0.03, 4, 0.03)
            eulerRotation: Qt.vector3d(0, 0, 90) // Rotation order is assumed to be ZXY
            materials: [ DefaultMaterial {
                    diffuseColor: "white"
                }
            ]
        }

        Model {
            id: purpleModel
            position: Qt.vector3d(-200, 0, 0)
            source: "#Cylinder"
            scale: Qt.vector3d(0.05, 0.01, 0.05)
            eulerRotation: Qt.vector3d(0, 0, 90) // Rotation order is assumed to be ZXY
            materials: [ DefaultMaterial {
                    diffuseColor: "purple"
                }
            ]
        }

//        Timer {
//            property double scale: 0.01
//            interval: 300; running: true; repeat: true
//            onTriggered: {
//                purpleModel.scale = Qt.vector3d( 0.05, (scale = scale + 0.01), 0.05 )
//                purpleModel.x = purpleModel.x + 0.5
//            }
//        }



//        AxisHelper {
//            enableAxisLines: false
//        }


//        function parseKeys( event ) {


//            // угол обзора камеры
//            else if ( event.key === Qt.Key_P )
//                    camera.fieldOfView++;
//            else if ( event.key === Qt.Key_O )
//                    camera.fieldOfView--;

//            // вращение по оси X камеры
//            else if ( event.key === Qt.Key_Q )
//                    camera.rotate( -1, Qt.vector3d( 0, 1, 0 ), Node.LocalSpace );
//            else if ( event.key === Qt.Key_E )
//                    camera.rotate( 1, Qt.vector3d( 0, 1, 0 ), Node.LocalSpace );
//        }
    }

    WasdController {
        controlledObject: camera
    }
}
