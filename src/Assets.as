package  
{

	public class Assets 
	{
		//Tiles
		[Embed(source = "../res/tileset.png")] 			
		public static const G_TILES:Class;
		
		//ENEMIES!!!
		[Embed(source = "../res/dark-wizard.png")] 			
		public static const G_DARK_WIZARD:Class;
		[Embed(source = "../res/black-sheep.png")] 			
		public static const G_BLACK_SHEEP:Class;	//Every family has one. This game has many
		[Embed(source = "../res/hobgoblin.png")]
		public static const G_HOBGOBLIN:Class;
		
		//Player
		[Embed(source = "../res/wizard.png")] 			
		public static const G_WIZARD:Class;
		[Embed(source = "../res/sheep.png")] 			
		public static const G_SHEEP:Class;
		[Embed(source = "../res/goblin.png")]
		public static const G_GOBLIN:Class;
		
		//Projectiles
		[Embed(source = "../res/fireball.png")] 			
		public static const G_FIREBALL:Class;
		[Embed(source = "../res/blue-fireball.png")] 			
		public static const G_BLUE_FIREBALL:Class;
		
		//Slots
		[Embed(source = "../res/slots/joker1.png")]
		public static const G_JOKER_1:Class;
		[Embed(source = "../res/slots/joker2.png")]
		public static const G_JOKER_2:Class;
		[Embed(source = "../res/slots/joker3.png")]
		public static const G_JOKER_3:Class;
		[Embed(source = "../res/slots/goblin.png")]
		public static const G_SLOT_GOBLIN:Class;	//don't wanna be a hobgoblin? be a slot goblin!
		[Embed(source = "../res/slots/sheep.png")]
		public static const G_SLOT_SHEEP:Class;
		[Embed(source = "../res/slots/wizard.png")]
		public static const G_SLOT_WIZARD:Class;		
		
		//misc
		[Embed(source = "../res/disco_fg.png")] 			
		public static const G_DISCO:Class;
		
	}

}