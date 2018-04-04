package {

import starling.display.Sprite;
import starling.events.Event;
import nape.shape.Circle;
import nape.shape.Polygon;
import nape.space.Space;
import nape.util.BitmapDebug;



public class Game extends Sprite
{
    private var myDebugger:BitmapDebug;
    private var mySpace:Space;
    private var screenWidth:Number;
    private var screenHeight:Number;

    public function Game() {
        trace("Hello world!!!!");
        this.addEventListener(Event.ADDED_TO_STAGE, onInit);
    }

    private function onInit(event:Event):void {

    }

    private function InitDebugAndSpace():void
    {


    }
    private function InitBodies():void
    {


    }

    private function UpdateWorld():void
    {


    }

    //Stopped at 9:01


}
}
