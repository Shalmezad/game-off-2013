package  
{
	import org.flixel.*;
	public class GUI extends FlxGroup
	{
		private var healthText:FlxText;
		public var playerHealth:int = 100;
		
		private var scoreText:FlxText;
		public var score:int = 0;
		
		public var slotBG:FlxSprite
		
		private var playerSlot:SlotReel;
		private var enemySlot:SlotReel;
		private var otherSlot:SlotReel;
		
		public function GUI() 
		{
			healthText = new FlxText(10, 10, 200, "Health: 100/100");
			add(healthText);
			
			scoreText = new FlxText(320 - 100, 5, 100, "Score: " + score);
			add(scoreText);
			
			slotBG = new FlxSprite(Main.GAME_CENTER_X - 60, 210 - 12);
			slotBG.loadGraphic(Assets.G_SLOT_BACKGROUND);
			slotBG.immovable = true;
			add(slotBG);
			
			playerSlot = new SlotReel(Main.GAME_CENTER_X - 24, 210);
			enemySlot = new SlotReel(Main.GAME_CENTER_X - 8, 210, SlotReel.SLOT_TYPE_ENEMY);
			otherSlot = new SlotReel(Main.GAME_CENTER_X + 8, 210, SlotReel.SLOT_TYPE_OTHER);
			
			playerSlot.scale = new FlxPoint(2, 2);
			playerSlot.setAll("x", Main.GAME_CENTER_X - 48);
			enemySlot.scale = new FlxPoint(2, 2);
			enemySlot.setAll("x", Main.GAME_CENTER_X - 16);
			otherSlot.scale = new FlxPoint(2, 2);
			otherSlot.setAll("x", Main.GAME_CENTER_X + 16);
			
			
			add(playerSlot);
			add(enemySlot);
			add(otherSlot);
		}
		
		public function addScore(enemyType:int):void
		{
			switch(enemyType)
			{
				case Enemy.TYPE_SHEEP:
					score += 10;
					break;
				case Enemy.TYPE_GOBLIN:
					score += 20;
					break;
				case Enemy.TYPE_WIZARD:
					score += 30;
					break;
			}
			scoreText.text = "Score: " + score;
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