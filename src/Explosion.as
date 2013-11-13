package  
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxParticle;

	public class Explosion extends FlxEmitter
	{
		
		public function Explosion(x:Number=0, y:Number=0, color:int = 0xFFFFFFFF) 
		{
			super(x, y, 30);	
			var particle:FlxParticle;
			for (var i:int = 0; i < maxSize/2; i++) 
			{
				particle = new FlxParticle();
				particle.makeGraphic(2, 2, color);
				particle.visible = false; //Make sure the particle doesn't show up at (0, 0)
				add(particle);
				particle = new FlxParticle();
				particle.makeGraphic(1, 1, color);
				particle.visible = false; //Make sure the particle doesn't show up at (0, 0)
				add(particle);
			}
			start(true, 3, .01);
		}
		
	}

}