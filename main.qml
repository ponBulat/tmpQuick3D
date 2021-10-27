import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

import QtQuick3D
import QtQuick3D.Helpers

Window {
    width: 640
    height: 480
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

        // все нажатия клавиш отправляем на парсинг в отдельную функцию
        Keys.onPressed: (event)=> { view.parseKeys( event ) };

        //! [environment]
//        environment: SceneEnvironment {
//            clearColor: "skyblue"
//            backgroundMode: SceneEnvironment.Color
//        }
        //! [environment]

        //! [camera]
        PerspectiveCamera {
            id: camera
            position: Qt.vector3d(0, 200, 600)
        }
        //! [camera]

        //! [light]
        DirectionalLight {}
        //! [light]

        //! [objects]
        Model {
//            position: Qt.vector3d(0, 0, 0)
            source: "#Cylinder"
            scale: Qt.vector3d(0.1, 2, 0.1)
//            eulerRotation: Qt.vector3d(100, 100, 20)
            materials: [ DefaultMaterial {
                    diffuseColor: "yellow"
                }
            ]
        }

        AxisHelper {
//            enableAxisLines: false

        }

//        Model {
//            position: Qt.vector3d(0, 150, 0)
//            source: "#Sphere"


//            materials: [ DefaultMaterial {
//                    diffuseColor: "blue"
//                }
//            ]

            //! [animation]
//            SequentialAnimation on y {
//                loops: Animation.Infinite
//                NumberAnimation {
//                    duration: 3000
//                    to: -150
//                    from: 150
//                    easing.type:Easing.InQuad
//                }
//                NumberAnimation {
//                    duration: 3000
//                    to: 150
//                    from: -150
//                    easing.type:Easing.OutQuad
//                }
//            }
            //! [animation]
//        }
        //! [objects]

        function parseKeys( event ) {

            // вверх и вниз
            if( event.key === Qt.Key_W )
                    camera.y++;
            else if( event.key === Qt.Key_S )
                    camera.y--;

            // влево и вправо
            else if ( event.key === Qt.Key_A )
                    camera.x--;
            else if ( event.key === Qt.Key_D )
                    camera.x++;

            // угол обзора камеры
            else if ( event.key === Qt.Key_P )
                    camera.fieldOfView++;
            else if ( event.key === Qt.Key_O )
                    camera.fieldOfView--;

            // вращение по оси X камеры
            else if ( event.key === Qt.Key_Q )
                    camera.rotate( -1, Qt.vector3d( 0, 1, 0 ), Node.LocalSpace );
            else if ( event.key === Qt.Key_E )
                    camera.rotate( 1, Qt.vector3d( 0, 1, 0 ), Node.LocalSpace );
        }
    }
}
