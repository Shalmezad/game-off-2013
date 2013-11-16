package  
{
	import org.flixel.*;
	public class GUI extends FlxGroup
	{
		private var healthText:FlxText;
		public var playerHealth:int = 100;
		
		private var playerSlot:SlotReel;
		private var enemySlot:SlotReel;
		private var otherSlot:SlotReel;
		
		public function GUI() 
		{
			healthText = new FlxText(10, 10, 200, "Health: 100/100");
			add(healthText);
			
			var branding:FlxText;
			branding = new FlxText(320 - 100, 5, 100, "Shalmezad");
			add(branding);
			
			playerSlot = new SlotReel(Main.GAME_CENTER_X - 24, 200);
			enemySlot = new SlotReel(Main.GAME_CENTER_X - 8, 200, SlotReel.SLOT_TYPE_ENEMY);
			otherSlot = new SlotReel(Main.GAME_CENTER_X + 8, 200, SlotReel.SLOT_TYPE_OTHER);
			
			add(playerSlot);
			add(enemySlot);
			add(otherSlot);
		}
		
		public function startSlots():void
		{
			playerSlot.startSlot();
			enemySlot.startSlot();
			otherSlot.startSlot();
		}
		
		override public function update():void
		{
			super.update();
			healthText.text = "Health: " + playerHealth + "/100";
		}
	}

}