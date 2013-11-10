package  
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxParticle;
	
	public class PoofCloud extends FlxEmitter
	{
		
		public function PoofCloud(x:Number=0, y:Number=0) 
		{
			super(x, y, 80);
			var particle:FlxParticle;
			for (var i:int = 0; i < maxSize/2; i++) 
			{
				particle = new FlxParticle();
				particle.makeGraphic(2, 2, 0xCCFFFFFF);
				particle.visible = false; //Make sure the particle doesn't show up at (0, 0)
				add(particle);
				particle.maxVelocity.x = 40;
				particle.maxVelocity.y = 40;
				particle = new FlxParticle();
				particle.makeGraphic(1, 1, 0xCCFFFFFF);
				particle.visible = false; //Make sure the particle doesn't show up at (0, 0)
				add(particle);
				particle.maxVelocity.x = 40;
				particle.maxVelocity.y = 40;
			}
			start(true, .5, .1);
		}
		
	}

}