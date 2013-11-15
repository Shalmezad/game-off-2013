package  
{
	import org.flixel.*;
	public class SlotReel extends FlxGroup
	{
		
		private const SLOT_HEIGHT:int = 16;
		private const SLOT_SPIN_TIME:int = 200;
		
		public static const SLOT_TYPE_PLAYER:int = 0;
		public static const SLOT_TYPE_ENEMY:int = 1;
		public static const SLOT_TYPE_OTHER:int = 2;
		
		private var slot:FlxSprite;
		
		private var spinning:Boolean;
		
		private var switchTick:int;
		
		private var slotType:int;
		private var currentSlot:int;
		private var currentTime:int;
		
		public function SlotReel(x:int =0, y:int = 0, slotType:int = SLOT_TYPE_PLAYER) 
		{
			slot = new FlxSprite(x, y);
			spin();
			add(slot);
			spinning = true;
			switchTick = 0;
			this.slotType = slotType;
			currentTime = 0;
		}
		
		override public function update():void
		{
			super.update();
			if (spinning)
			{
				currentTime++;
				switchTick++;
				if (switchTick >= 10)
				{
					switchTick = 0;
					spin();
				}
				if (currentTime > SLOT_SPIN_TIME)
				{
					stopSlot();
				}
			}
		}
		
		private function stopSlot():void
		{
			//stop spinning
			spinning = false;
			//and act
			if (slotType == SLOT_TYPE_PLAYER)
				slotActPlayer();
			else if (slotType == SLOT_TYPE_ENEMY)
				slotActEnemy();
		}
		
		public function startSlot():void
		{
			switchTick = 0;
			currentTime = 0;
			spinning = true;
		}
		
		private function slotActPlayer():void
		{
			switch(currentSlot)
			{
				case 0:
					//joker
					Registry.player.change();
					break;
				case 1:
					//goblin
					Registry.player.toGoblin();
					break;
				case 2:
					//sheep
					Registry.player.toSheep();
					break;
				case 3:
					//wizard
					Registry.player.toWizard();
					break;
			}
		}
		
		private function slotActEnemy():void
		{
			switch(currentSlot)
			{
				case 0:
					//joker
					Registry.enemies.change();
					break;
				case 1:
					//goblin
					Registry.enemies.toGoblin();
					break;
				case 2:
					//sheep
					Registry.enemies.toSheep();
					break;
				case 3:
					//wizard
					Registry.enemies.toWizard();
					break;
			}
		}
		
		private function spin():void
		{
			if (slotType == SLOT_TYPE_PLAYER)
				slotSpinPlayer();
			else if (slotType == SLOT_TYPE_ENEMY)
				slotSpinEnemy();
		}
		
		private function slotSpinPlayer():void
		{
			var reelType:int = Math.random() * 4;
			switch(reelType)
			{
				case 0:
					slot.loadGraphic(Assets.G_JOKER_1);
					currentSlot = 0;
					break;
				case 1:
					slot.loadGraphic(Assets.G_SLOT_GOBLIN);
					currentSlot = 1;
					break;
				case 2:
					slot.loadGraphic(Assets.G_SLOT_SHEEP);
					currentSlot = 2;
					break;
				case 3:
					slot.loadGraphic(Assets.G_SLOT_WIZARD);
					currentSlot = 3;
					break;
			}
		}
		
		
		private function slotSpinEnemy():void
		{
			var reelType:int = Math.random() * 4;
			switch(reelType)
			{
				case 0:
					slot.loadGraphic(Assets.G_JOKER_2);
					currentSlot = 0;
					break;
				case 1:
					slot.loadGraphic(Assets.G_SLOT_HOBGOBLIN);
					currentSlot = 1;
					break;
				case 2:
					slot.loadGraphic(Assets.G_SLOT_BLACK_SHEEP);
					currentSlot = 2;
					break;
				case 3:
					slot.loadGraphic(Assets.G_SLOT_DARK_WIZARD);
					currentSlot = 3;
					break;
			}
		}
		
	}

}