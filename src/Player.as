package  
{
	import org.flixel.*;
	public class Player extends FlxSprite
	{
		
		private var changeColor:int = 0;
		
		private const SHEEP_ACCEL:int = 240;
		private const SHEEP_MAX_VEL:int = 240;
		
		private const WIZARD_ACCEL:int = 160;
		private const WIZARD_MAX_VEL:int = 200;
		
		private var accel:int;
		
		public function Player() 
		{
			loadGraphic(Assets.G_WIZARD);
			accel = WIZARD_ACCEL;
			drag.x = 100;
			drag.y = 100;
		}
		
		public function change():void
		{
			changeColor = 0;
			var changeShape:int = Math.random() * 2;
			if (changeShape == 1) {
				toSheep();
			}
			else {
				toWizard();
			}
		}
		
		public function toSheep():void
		{
			loadGraphic(Assets.G_SHEEP);
			accel = SHEEP_ACCEL;
			maxVelocity.x = SHEEP_MAX_VEL;
			maxVelocity.y = SHEEP_MAX_VEL;
		}
		public function toWizard():void
		{
			loadGraphic(Assets.G_WIZARD);
			accel = WIZARD_ACCEL;
			maxVelocity.x = WIZARD_MAX_VEL;
			maxVelocity.y = WIZARD_MAX_VEL;
		}
		
		override public function update():void
		{
			super.update();
			acceleration.x = 0;
			acceleration.y = 0;
			if (Key.UP && !Key.DOWN) {
				acceleration.y = -1 * accel;
			}
			else if (Key.DOWN && !Key.UP) {
				acceleration.y = accel;
			}
			
			if (Key.LEFT && !Key.RIGHT) {
				acceleration.x = -1 * accel;
			}
			else if (Key.RIGHT && !Key.LEFT) {
				acceleration.x = accel;
			}
			
			angle = Math.atan2(FlxG.mouse.y - y, FlxG.mouse.x - x) / Math.PI * 180;
			
			changeColor+= 5;
			if (changeColor > 255)
				changeColor = 255;
			var intVal:int = changeColor << 16 | changeColor << 8 | changeColor;
			this.color = intVal;
			
		}
		
	}

}