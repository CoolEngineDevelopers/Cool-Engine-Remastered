package eastereggs;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;


class ChristmasState extends MusicBeatState {


    var text = new FlxText();
    var bg = new FlxSprite();


    override public function create() {
        bg = new FlxSprite(-1000, -500).loadGraphic(Paths.image('eastereggs/christmas/bg'));
        bg.antialiasing = true;
        bg.scrollFactor.set(0.2, 0.2);
        bg.active = false;
        bg.setGraphicSize(Std.int(bg.width * 0.8));
        bg.updateHitbox();
        add(bg);

        text = new FlxText(0,0,0,"Merry Christmas!!!\nur mom", 30);
        text.screenCenter();
        text.color = FlxColor.GREEN;
        add(text);
    }

    override public function update(elapsed) {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE) {
            FlxG.switchState(new MainMenuState());
        }
    }
}