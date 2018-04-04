package {

import flash.display.Sprite;
import flash.text.TextField;

import starling.core.Starling;

public class Main extends Sprite {

    var starling:Starling;


    public function Main() {
        stage.frameRate = 60;
        starling = new Starling(Game, stage);
        starling.start();
        super();
    }
}
}
