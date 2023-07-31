import QtQuick
import QtQuick.Controls

import QtQuick3D
import QtQuick3D.Helpers

//import Qt3D.Input
//import Qt3D.Render

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    View3D {
        id: v3d
        anchors.fill: parent

        antialiasing: true


        Node {
            Model {
                id: axisX
                source: "#Cylinder"
                scale: Qt.vector3d(0.02, 10, 0.02)
                eulerRotation: Qt.vector3d(0, 0, 90)
                position: Qt.vector3d(scale.y * 100/*размер ячейки*/ / 2, 0, 0)
                materials: [
                    DefaultMaterial {
                        diffuseColor: 'red'
                        lighting: DefaultMaterial.NoLighting
                    }
                ]
            }

            Model {
                id: axisY
                source: "#Cylinder"
                scale: Qt.vector3d(0.02, 10, 0.02)
                position: Qt.vector3d(0, scale.y * 100/*размер ячейки*/ / 2, 0)
                materials: [
                    DefaultMaterial {
                        diffuseColor: 'green'
                        lighting: DefaultMaterial.NoLighting
                    }
                ]
            }

            Model {
                id: axisZ
                source: "#Cylinder"
                scale: Qt.vector3d(0.02, 10, 0.02)
                eulerRotation: Qt.vector3d(90, 0, 0)
                position: Qt.vector3d(0, 0, scale.y * 100/*размер ячейки*/ / 2)
                materials: [
                    DefaultMaterial {
                        diffuseColor: 'blue'
                        lighting: DefaultMaterial.NoLighting
                    }
                ]
            }
        }


//        Model {
//            id: whiteModel
////            scale: Qt.vector3d(1, 1, 1)
////            position: Qt.vector3d(50, 50, 10)

//            geometry: HeightFieldGeometry {
////                source:
//            }

//            pickable: true
//            source: "#Cube"
//            geometry: GridGeometry {
//                horizontalLines: 50
//                verticalLines: 50
//            }

//            materials: [
//                DefaultMaterial {
//                    lighting: DefaultMaterial.NoLighting
//                    diffuseColor: "red"

////                    lighting: PrincipledMaterial.NoLighting
////                    opacity: 0.3
////                    diffuseColor: "blue"
//                }
//            ]
//        }

        AxisHelper {
            enableXYGrid: true
            enableXZGrid: false
            enableAxisLines: false
            gridColor: "grey"
        }

        WasdController {
//            controlledObject: orthoCamera
            controlledObject: perCamera
        }

//        ObjectPicker {
//            hoverEnabled: true
////            dragEnabled: true
////            enabled: true
//            onPressed: pick => console.log( 'dis: ' , JSON.stringify( pick.distance ) )
//        }


        PerspectiveCamera  {
            id: perCamera
            position: Qt.vector3d(100, 50, 300)
        }

        DirectionalLight {
//            position: Qt.vector3d(-500, 500, -100)
        }
    }

    DebugView {
        source: v3d
    }



//    function wheelChanged( wheel ) {

//        console.log( JSON.stringify( wheel ) )

//        orthoCamera.horizontalMagnification += wheel.angleDelta.y * 0.0005
//        orthoCamera.verticalMagnification  += wheel.angleDelta.y * 0.0005

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
//    }
}
