import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick.Controls
import QtQuick.Controls.Material

ApplicationWindow {
    width: 1280
    height: 1024
    visible: true
    title: qsTr("Hello World")


    Material.theme: Material.Dark
//    Material.accent: Material.Purple


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

//        camera: perCamera
        camera: orthoCamera

        AxisHelper {
            enableXYGrid: true
            enableXZGrid: false
            gridColor: "grey"
        }


        MouseArea {
            anchors.fill: parent

            acceptedButtons: Qt.AllButtons

            // mouse sensitivity
            pressAndHoldInterval: 200 // default 800

            onWheel: ( wheel ) => wheelChanged( wheel );

        }

//        OrbitCameraController {
//            anchors.fill: parent

////            origin: originPerNode
////            camera: perCamera

//            origin: originOrthoNode
//            camera: orthoCamera
//        }

        //! [camera]

        Node {
            id: originPerNode
            PerspectiveCamera  {
                id: perCamera
                position: Qt.vector3d(100, 100, 600)
            }
        }

        Node {
            id: originOrthoNode
            OrthographicCamera {
                id: orthoCamera
                z: 100
            }
        }

        //! [camera]

        //! [light]
//        DirectionalLight {}
        //! [light]

        //! [objects]
        Model {
            id: whiteModel
            source: "#Cube"
            materials: [
                DefaultMaterial {
                    lighting: PrincipledMaterial.NoLighting
                    opacity: 0.3
                    diffuseColor: "#4287f5"
                }
            ]
        }

        //! [objects]
    }

//    WasdController {
//        controlledObject: orthoCamera
////        controlledObject: perCamera

//    }



    function wheelChanged( wheel ) {

//        console.log( JSON.stringify( wheel ) )

        orthoCamera.horizontalMagnification += wheel.angleDelta.y * 0.0005
        orthoCamera.verticalMagnification  += wheel.angleDelta.y * 0.0005

//        orthoCamera.x = wheel

//            if( wheel.angleDelta.y < 0 || orthoCamera.scale.x > 0.05) {
//                const delta = wheel.angleDelta.y * 0.0001;
//                orthoCamera.scale.x -= delta;
//                orthoCamera.scale.y -= delta;
//                orthoCamera.scale.z -= delta;

//                perspectiveCamera.pivot.z = -500*orthoCamera.scale.z;

//                wheelChangedInOrtho( delta < 0 ? false : true )
//            }
//        }
        //console.log(perspectiveCamera.pivot.z, perspectiveCamera.fieldOfView, scene3D.height);
    }
}
