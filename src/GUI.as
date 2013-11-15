package  
{
	import org.flixel.*;
	public class GUI extends FlxGroup
	{
		private var healthText:FlxText;
		public var playerHealth:int = 100;
		private var mainSlot:SlotReel;
		
		public function GUI() 
		{
			healthText = new FlxText(10, 10, 200, "Health: 100/100");
			add(healthText);
			
			var branding:FlxText;
			branding = new FlxText(320 - 100, 5, 100, "Shalmezad");
			add(branding);
			
			//add(new SlotReel(Main.GAME_CENTER_X-24, 200));
			//add(new SlotReel(Main.GAME_CENTER_X-8, 200));
			//add(new SlotReel(Main.GAME_CENTER_X+8, 200));
			mainSlot = new SlotReel(Main.GAME_CENTER_X - 8, 200);
			add(mainSlot);
		}
		
		public function startSlots():void
		{
			mainSlot.startSlot();
		}
		
		override public function update():void
		{
			super.update();
			healthText.text = "Health: " + playerHealth + "/100";
		}
	}

}