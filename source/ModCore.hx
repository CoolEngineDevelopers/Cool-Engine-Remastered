package;

import FunkinModClient.ModClient;
import flixel.FlxG;
import flixel.FlxSprite;

class FunkinMods extends MusicBeatState {
    public var bg:FlxSprite;

    public var name:Alphabet;
    public var desc:Alphabet;

    public var modClient = new FunkinModClient();

    override public function create() {
        super.create();

        modClient.grabClient();
        modClient.list();


        bg = new FlxSprite().loadGraphic(Paths.image('menuBGBlue'));

        name = new Alphabet(13, 13, modClient.modName, true,false);
        add(name);

        desc = new Alphabet(13, 26, modClient.modDescription, false, false);
        add(desc);



        
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE) {
            FlxG.switchState(new MainMenuState());
        }
    }
}