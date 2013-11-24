package  
{
	import org.flixel.*;
	public class Player extends FlxSprite
	{
		
		private var changeColor:int = 0;
		
		private const SHEEP_ACCEL:int = 240;
		private const SHEEP_MAX_VEL:int = 240;
		public static const TYPE_SHEEP:int = 1;
		
		private const WIZARD_ACCEL:int = 160;
		private const WIZARD_MAX_VEL:int = 200;
		public static const TYPE_WIZARD:int = 2;
		
		private const GOBLIN_ACCEL:int = 100;
		private const GOBLIN_MAX_VEL:int = 160;
		public static const TYPE_GOBLIN:int = 3;
		
		private const MAX_HEALTH:int = 100;
		
		private var accel:int;
		public var playerType:int;
		
		public function Player() 
		{
			loadGraphic(Assets.G_WIZARD);
			accel = WIZARD_ACCEL;
			drag.x = 100;
			drag.y = 100;
			health = MAX_HEALTH;
			
			x = Main.GAME_WIDTH / 2;
			y = Main.GAME_HEIGHT / 2;
			change();
		}
		
		public function change():void
		{
			changeColor = 0;
			var changeShape:int = Math.random() * 3;
			if (changeShape == 0) 
			{
				toSheep();
			}
			else if(changeShape == 1)
			{
				toWizard();
			}
			else
			{
				toGoblin();
			}
		}
		
		public function toSheep():void
		{
			loadGraphic(Assets.G_SHEEP);
			accel = SHEEP_ACCEL;
			maxVelocity.x = SHEEP_MAX_VEL;
			maxVelocity.y = SHEEP_MAX_VEL;
			playerType = TYPE_SHEEP;
		}
		public function toWizard():void
		{
			loadGraphic(Assets.G_WIZARD);
			accel = WIZARD_ACCEL;
			maxVelocity.x = WIZARD_MAX_VEL;
			maxVelocity.y = WIZARD_MAX_VEL;
			playerType = TYPE_WIZARD;
		}
		
		public function toGoblin():void
		{
			loadGraphic(Assets.G_GOBLIN);
			accel = GOBLIN_ACCEL;
			maxVelocity.x = GOBLIN_MAX_VEL;
			maxVelocity.y = GOBLIN_MAX_VEL;
			playerType = TYPE_GOBLIN;
		}
		
		override public function update():void
		{
			super.update();
			acceleration.x = 0;
			acceleration.y = 0;
			if (Key.UP && !Key.DOWN) 
			{
				acceleration.y = -1 * accel;
			}
			else if (Key.DOWN && !Key.UP) 
			{
				acceleration.y = accel;
			}
			
			if (Key.LEFT && !Key.RIGHT) 
			{
				acceleration.x = -1 * accel;
			}
			else if (Key.RIGHT && !Key.LEFT) 
			{
				acceleration.x = accel;
			}
			
			angle = Math.atan2(FlxG.mouse.y - centerY, FlxG.mouse.x - centerX) / Math.PI * 180;
			
			changeColor+= 5;
			if (changeColor > 255)
				changeColor = 255;
			var intVal:int = changeColor << 16 | changeColor << 8 | changeColor;
			this.color = intVal;
			
			keepInBounds();
			
			if (health > 0) {
				health += .005;
				if (health > MAX_HEALTH) {
					health = MAX_HEALTH;
				}
			}
		}
		
		private function keepInBounds():void
		{
			if (x < 0) 
			{
				x = 0;
				velocity.x = Math.max(velocity.x, 0);
			}
			else if (x + width > Main.GAME_WIDTH) 
			{
				x = Main.GAME_WIDTH - width;
				velocity.x = Math.min(velocity.x, 0);
			}
			if (y < 0) 
			{
				y = 0;
				velocity.y = Math.max(velocity.y, 0);
			}
			else if (y + height > Main.GAME_HEIGHT) 
			{
				y = Main.GAME_HEIGHT - height;
				velocity.y = Math.min(velocity.y, 0);
			}
		}
		
		
		public function get centerX():int
		{
			return x + width / 2;
		}
		public function get centerY():int
		{
			return y + height / 2;
		}
	}

}