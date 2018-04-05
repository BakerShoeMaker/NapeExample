package {

import flash.filesystem.File;

import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.phys.Material;
import starling.events.Event;
import starling.core.Starling;

import starling.display.Sprite;
import starling.events.Event;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.space.Space;
import nape.util.BitmapDebug;

import starling.utils.AssetManager;


public class Game extends Sprite
{
        public static var assets:AssetManager = new AssetManager();
        private var appDir:File = File.applicationDirectory;

        private var myDebugger:BitmapDebug;
        private var mySpace:Space;
        private var screenWidth:Number;
        private var screenHeight:Number;

        public function Game() {
            trace("Hello world!!!!");

            loadAssets();
            this.addEventListener(Event.ADDED_TO_STAGE, onInit);
        }
        private function loadAssets():void{
            assets.enqueue(appDir.resolvePath("gameAssets/"));
            assets.loadQueue(function (ratio:Number):void {
                if(ratio == 1.0){
                    onInit();
                }
            });
        }

        private function onInit(event:Event):void {
            InitDebugAndSpace();
            InitBodies();
            addEventListener(Event.ENTER_FRAME, UpdateWorld);
        }

        private function InitDebugAndSpace():void
        {
            var worldGravity:Vec2 = Vec2.weak(0,500);
            mySpace = new Space(worldGravity);

            screenWidth  = Starling.current.nativeStage.fullScreenWidth;
            screenHeight  = Starling.current.nativeStage.fullScreenHeight;
            myDebugger = new BitmapDebug(screenWidth, screenHeight, 0x000000);
            Starling.current.nativeOverlay.addChild(myDebugger.display);

        }
        private function InitBodies():void
        {
            var floor: Body = new Body();
            floor.type = BodyType.STATIC;
            floor.shapes.add(new Polygon(Polygon.rect(0, screenHeight -20, screenWidth, 20)));
            floor.space = mySpace;

            var boulder:Body = new Body(BodyType.DYNAMIC);
            boulder.shapes.add(new Circle(50));
            //boulder.setShapeMaterials(Material.steel());
            boulder.setShapeMaterials(Material.rubber());
            boulder.position.setxy(screenWidth/2, 100);
            boulder.space = mySpace;

            for( var i:int =0; i<10; i++)
            {
                for(var j:int = 0; j<10 ;j++ )
                {
                    var brick:Body = new Body(BodyType.DYNAMIC);
                    //brick.setShapeMaterials(Material.rubber());
                    brick.shapes.add(new Polygon(Polygon.box(20,20)));
                    brick.position.setxy((screenWidth/2 - 100) + (j*20), (screenHeight -40)- (i*20));
                    brick.space = mySpace;
                }
            }
        }

        private  function  UpdateWorld(evt:Event ):void
        {
            myDebugger.clear();
            mySpace.step(1/60);

            myDebugger.draw(mySpace);
            myDebugger.flush();
        }


} //end of class
}//end of package

