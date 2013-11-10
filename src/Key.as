package  
{
	import org.flixel.FlxG;
	public class Key 
	{
		public static function get LEFT():Boolean
		{
			return FlxG.keys.LEFT || FlxG.keys.A;
		}
		
		public static function get RIGHT():Boolean
		{
			return FlxG.keys.RIGHT || FlxG.keys.D;
		}
		
		public static function get JUMP():Boolean
		{
			return FlxG.keys.UP || FlxG.keys.W;
		}
		
		public static function get CHANGE():Boolean
		{
			return FlxG.keys.SPACE;
		}
		
		public static function get JUST_RELEASED_CHANGE():Boolean
		{
			return FlxG.keys.justReleased("SPACE");
		}
	}

}