package;

import sys.FileSystem;
import flixel.input.keyboard.FlxKey;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.system.FlxSound;
import flixel.math.FlxMath;
import hscript.Parser;
import hscript.Interp;
import StringTools;

class FunkinScript {
    public var interp = new Interp();
	public var parser = new Parser();
	public var script:hscript.Expr;

    public var exists = false;

	public function new()
	{
		parser.allowTypes = true;
		parser.allowJSON = true;
		parser.allowMetadata = true;
		interp.variables.set("create", FlxG.state.create);
		interp.variables.set("update", FlxG.state.update);
		interp.variables.set("Int", Int);
		interp.variables.set("String", String);
		interp.variables.set("Float", Float);
		interp.variables.set("Array", Array);
		interp.variables.set("Bool", Bool);
		interp.variables.set("Dynamic", Dynamic);
		interp.variables.set("Math", Math);
		interp.variables.set("Main", Main);
		interp.variables.set("FlxMath", FlxMath);
		interp.variables.set("Std", Std);
		interp.variables.set("StringTools", StringTools);
		interp.variables.set("FlxG",FlxG);
		interp.variables.set("FlxSound",FlxSound);
		interp.variables.set("FlxSprite",FlxSprite);
		interp.variables.set("FlxText",FlxText);
		interp.variables.set("Paths",Paths);
		interp.variables.set("CoolUtil",CoolUtil);

        interp.variables.set('Modchart', Modchart);
	}

	public function call(funcName:String, ?args:Array<Dynamic>):Dynamic
	{
        if (exists) {
            if (args == null)
                args = [];
            // if(!running) return true;
            try
            {
                var func:Dynamic = interp.variables.get(funcName);
                if (func != null && Reflect.isFunction(func))
                    return Reflect.callMethod(null, func, args);
            }
            catch (e)
            {
                // scriptType = EmptyScript;
                FlxG.log.add(e.details());
                // running = false;
            }
            return true;
        } else {
            return false;
        }

        return null;
	}

	public function loadScript(file:String)
	{
        if (FileSystem.exists(Paths.getScript(file))) {
            script = parser.parseString(openfl.Assets.getText(Paths.getScript('$file')));
            exists = true;
            interp.execute(script);
        } else {
            trace("Does not exist");
        }
	}
}

class Modchart {
    public static var noArgEvent = [];


    public static function triggerEvent(name:String, ?arg1, ?arg2) {
        switch(name) {
            case "Add Camera Zoom":
                FlxG.camera.zoom += arg1;
            case "Christmas State":
                
        }
    }  
}