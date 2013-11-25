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
		[Embed(source = "../res/sand-golem.png")]
		public static const G_SAND_GOLEM:Class;
		
		//Player
		[Embed(source = "../res/wizard.png")] 			
		public static const G_WIZARD:Class;
		[Embed(source = "../res/sheep.png")] 			
		public static const G_SHEEP:Class;
		[Embed(source = "../res/goblin.png")]
		public static const G_GOBLIN:Class;
		[Embed(source = "../res/golem.png")]
		public static const G_GOLEM:Class;
		
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
		[Embed(source = "../res/slots/golem.png")]
		public static const G_SLOT_GOLEM:Class;
		[Embed(source = "../res/slots/hobgoblin.png")]
		public static const G_SLOT_HOBGOBLIN:Class;	//why just be a slot goblin?
		[Embed(source = "../res/slots/black-sheep.png")]
		public static const G_SLOT_BLACK_SHEEP:Class;
		[Embed(source = "../res/slots/dark-wizard.png")]
		public static const G_SLOT_DARK_WIZARD:Class;
		[Embed(source = "../res/slots/sand-golem.png")]
		public static const G_SLOT_SAND_GOLEM:Class;
		[Embed(source = "../res/slots/ice.png")]
		public static const G_SLOT_ICE:Class;
		[Embed(source = "../res/slots/sand.png")]
		public static const G_SLOT_SAND:Class;
		[Embed(source = "../res/slots/greentile.png")]
		public static const G_SLOT_TILE:Class;
		
		[Embed(source = "../res/slot-bgx2.png")]
		public static const G_SLOT_BACKGROUND:Class;
		
		//misc
		[Embed(source = "../res/disco_fg.png")] 			
		public static const G_DISCO:Class;
		
		[Embed(source = "../res/music/RunningBass.mp3")] 
		public static const BG_MUSIC:Class;
		
	}

}