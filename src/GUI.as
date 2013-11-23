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
			
			var slotBG:FlxSprite;
			slotBG = new FlxSprite(Main.GAME_CENTER_X - 26, 210 - 2);
			slotBG.loadGraphic(Assets.G_SLOT_BACKGROUND);
			slotBG.scale = new FlxPoint(2, 2);
			slotBG.x = Main.GAME_CENTER_X - 34;
			add(slotBG);
			
			playerSlot = new SlotReel(Main.GAME_CENTER_X - 24, 210);
			enemySlot = new SlotReel(Main.GAME_CENTER_X - 8, 210, SlotReel.SLOT_TYPE_ENEMY);
			otherSlot = new SlotReel(Main.GAME_CENTER_X + 8, 210, SlotReel.SLOT_TYPE_OTHER);
			
			playerSlot.scale = new FlxPoint(2, 2);
			playerSlot.setAll("x", Main.GAME_CENTER_X - 48);
			//playerSlot.x = Main.GAME_CENTER_X - 48;
			enemySlot.scale = new FlxPoint(2, 2);
			enemySlot.setAll("x", Main.GAME_CENTER_X - 16);
			//enemySlot.x = Main.GAME_CENTER_X - 16;
			otherSlot.scale = new FlxPoint(2, 2);
			otherSlot.setAll("x", Main.GAME_CENTER_X + 16);
			//otherSlot.x = Main.GAME_CENTER_X + 16;
			
			
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