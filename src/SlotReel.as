package  
{
	import org.flixel.*;
	public class SlotReel extends FlxGroup
	{
		
		private const SLOT_HEIGHT:int = 16;
		
		private var slot:FlxSprite;
		
		private var spinning:Boolean;
		
		private var switchTick:int;
		
		public function SlotReel(x:int =0, y:int = 0) 
		{
			slot = new FlxSprite(x, y, Assets.G_JOKER_1);
			add(slot);
			spinning = true;
			switchTick = 0;
		}
		
		override public function update():void
		{
			super.update();
			if (spinning)
			{
				switchTick++;
				if (switchTick >= 10)
				{
					switchTick = 0;
					//switch
					var reelType:int = Math.random() * 3;
					switch(reelType)
					{
						case 0:
							slot.loadGraphic(Assets.G_JOKER_1);
							break;
						case 1:
							slot.loadGraphic(Assets.G_JOKER_2);
							break;
						case 2:
							slot.loadGraphic(Assets.G_JOKER_3);
							break;
					}
				}
			}
		}
		
	}

}