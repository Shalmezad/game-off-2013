package  
{
	import org.flixel.*;
	public class InstructionState extends FlxState
	{
		private const NUM_PAGES:int = 5;
		private var pageNum:int;
		public function InstructionState(pageNum:int = 1) 
		{
			this.pageNum = pageNum;
			switch(pageNum)
			{
				case 1:
					loadPage1();
					break;
				case 2:
					loadPage2();
					break;
				case 3:
					loadPage3();
					break;
				case 4:
					loadPage4();
					break;
				case 5:
					loadPage5();
					break;
			}
			
			var backButton:FlxButton;
			if (pageNum == 1)
			{
				//make it the menu button 
				backButton = new FlxButton(10, Main.GAME_HEIGHT - 40, "Main", toMain);
			}
			else
			{
				backButton = new FlxButton(10, Main.GAME_HEIGHT - 40, "Back", backPage);
			}
			add(backButton);
			
			if (pageNum < NUM_PAGES)
			{
				//add a next button
				var nextButton:FlxButton;
				nextButton = new FlxButton(Main.GAME_WIDTH - 90, Main.GAME_HEIGHT - 40, "Next", nextPage);
				add(nextButton);
			}
		}
		
		public function toMain():void
		{
			FlxG.switchState(new MenuState());
		}
		
		public function backPage():void
		{
			FlxG.switchState(new InstructionState(pageNum - 1));
		}
		public function nextPage():void
		{
			FlxG.switchState(new InstructionState(pageNum + 1));
		}
		
		public function loadPage1():void
		{
			add(new FlxText(20, 20, Main.GAME_WIDTH - 40, "Welcome to CHAOS SLOTS! The game where the slots determine your fate."));
			add(new FlxText(20, 50, Main.GAME_WIDTH - 40, "Controls:"));
			add(new FlxText(20, 70, Main.GAME_WIDTH - 40, "WASD/Arrows: Move"));
			add(new FlxText(20, 90, Main.GAME_WIDTH - 40, "Mouse: Aim/Shoot"));
		}
		
		
		public function loadPage2():void
		{
			add(new FlxText(20, 20, Main.GAME_WIDTH - 40, "The Machine:"));
			add(new FlxSprite(60, 40, Assets.G_SLOT_BACKGROUND));
			add(new FlxText(20, 70, Main.GAME_WIDTH - 40, "The machine consists of 3 parts:"));
			add(new FlxText(20, 80, Main.GAME_WIDTH - 40, " -Your slot"));
			add(new FlxText(20, 90, Main.GAME_WIDTH - 40, " -Enemy slot"));
			add(new FlxText(20, 100, Main.GAME_WIDTH - 40, " -Random slot"));
			add(new FlxText(20, 110, Main.GAME_WIDTH - 40, "Every so often, the slot will spin, and change the game. For better, or worse."));
		}
		public function loadPage3():void
		{
			add(new FlxText(20, 20, Main.GAME_WIDTH - 40, "Sheep:"));
			add(new FlxSprite(60, 40, Assets.G_SHEEP));
			add(new FlxSprite(80, 40, Assets.G_BLACK_SHEEP));
			add(new FlxText(20, 60, Main.GAME_WIDTH - 40, "A useless sheep. If you're lucky, your enemies will turn into them. However, if you turn into one, run or you'll become lamb chops!"));
		
			add(new FlxText(20, 100, Main.GAME_WIDTH - 40, "Strategy:"));
			add(new FlxText(30, 110, Main.GAME_WIDTH - 40, "RUN FOR YOUR LIFE!!!"));
		}
		
		public function loadPage4():void
		{
			add(new FlxText(20, 20, Main.GAME_WIDTH - 40, "Goblin:"));
			add(new FlxSprite(60, 40, Assets.G_GOBLIN));
			add(new FlxSprite(80, 40, Assets.G_HOBGOBLIN));
			add(new FlxText(20, 60, Main.GAME_WIDTH - 40, "Goblins are very good melee fighters. All they have to do is touch the enemy, and their dead. Avoid contact at all costs."));
		
			add(new FlxText(20, 100, Main.GAME_WIDTH - 40, "Strategy:"));
			add(new FlxText(30, 110, Main.GAME_WIDTH - 40, "Run into the enemies, make them mincemeat!"));
		}
		
		public function loadPage5():void
		{
			add(new FlxText(20, 20, Main.GAME_WIDTH - 40, "Wizard:"));
			add(new FlxSprite(60, 40, Assets.G_WIZARD));
			add(new FlxSprite(80, 40, Assets.G_DARK_WIZARD));
			add(new FlxText(20, 60, Main.GAME_WIDTH - 40, "A master of magic. Can quickly dispatch their foes with an barrage of fireballs. Hopefully, you won't be on the recieving end of their fire..."));
		
			add(new FlxText(20, 100, Main.GAME_WIDTH - 40, "Strategy:"));
			add(new FlxText(30, 110, Main.GAME_WIDTH - 40, "Keep your distance, and flame on."));
		}
	}

}