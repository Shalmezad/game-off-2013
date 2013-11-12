package  
{
	import org.flixel.*;
	public class GUI extends FlxGroup
	{
		private var healthText:FlxText;
		public var playerHealth:int = 100;
		public function GUI() 
		{
			healthText = new FlxText(10, 10, 200, "Health: 100/100");
			add(healthText);
			
			var branding:FlxText;
			branding = new FlxText(320 - 100, 5, 100, "Shalmezad");
			add(branding);
		}
		
		override public function update():void
		{
			super.update();
			healthText.text = "Health: " + playerHealth + "/100";
		}
	}

}