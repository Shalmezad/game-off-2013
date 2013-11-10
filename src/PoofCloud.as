package  
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxParticle;
	
	public class PoofCloud extends FlxEmitter
	{
		
		public function PoofCloud()
		{
			super(0, 0, 80);
			var particle:FlxParticle;
			for (var i:int = 0; i < maxSize/2; i++) 
			{
				particle = new FlxParticle();
				particle.makeGraphic(2, 2, 0xCCFFFFFF);
				particle.visible = false; //Make sure the particle doesn't show up at (0, 0)
				add(particle);
				particle.maxVelocity.x = Math.random() * 20 + 20;
				particle.maxVelocity.y = Math.random() * 20 + 20;
				particle = new FlxParticle();
				particle.makeGraphic(1, 1, 0xCCFFFFFF);
				particle.visible = false; //Make sure the particle doesn't show up at (0, 0)
				add(particle);
				particle.maxVelocity.x = Math.random() * 20 + 20;
				particle.maxVelocity.y = Math.random() * 20 + 20;
			}
		}
	}

}