import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick.Controls
import QtQuick.Controls.Material

ApplicationWindow {
    width: 1280
    height: 1024
    visible: true
//    title: qsTr("Hello World")


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


        //! [camera]
        OrthographicCamera {
            id: orthoCamera
//            position: Qt.vector3d(0, 200, 300)
            z: 300
//            eulerRotation.x: -30
        }
        //! [camera]

        //! [light]
//        DirectionalLight {}
        //! [light]

        //! [objects]
        Model {
            id: whiteModel
//            position: Qt.vector3d( 0, 0, 0 )
            source: "#Cylinder"
//            scale: Qt.vector3d(0.03, 4, 0.03)
//            eulerRotation: Qt.vector3d(0, 0, 90) // Rotation order is assumed to be ZXY

        }

        //! [objects]

    }

    WasdController {
        controlledObject: orthoCamera

    }

    function wheelChanged( wheel ) {

//        console.log( JSON.stringify( wheel ) )

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
