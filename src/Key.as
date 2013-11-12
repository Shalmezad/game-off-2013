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
		
		public static function get UP():Boolean
		{
			return FlxG.keys.UP || FlxG.keys.W;
		}
		public static function get DOWN():Boolean
		{
			return FlxG.keys.DOWN || FlxG.keys.S;
		}
		
	}

}