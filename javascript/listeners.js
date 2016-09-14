

var holsterEvent = glockchain.LogGunHolstered();
holsterEvent.watch(function(error, result){
    if (!error){
      console.log("*******************************************************");
      console.log("Gun ID:" + result.args.gunID + " safely Holstered at time: " + timeConverter(result.args.timestamp));
      console.log("ShooterID: " + result.args.shooter);
      console.log("*******************************************************");
    }
    else {
      console.log("oops something went wrong...")
    }
});

var drawnEvent = glockchain.LogGunDrawn();
drawnEvent.watch(function(error, result){
  if (!error){
      var theLat=result.args.latitude/1000000;
      var theLong=result.args.longitude/1000000;
    console.log("*******************************************************************************");
    console.log("OFFICER GUN DRAWN @ " + timeConverter(result.args.timestamp));
    console.log(" ");
    console.log(" ,--^----------,--------,-----,-------^--,"  );
    console.log(" | |||||||||   `--------'     |          O  "  );
    console.log("`+---------------------------^----------|"   );
    console.log("  `\\_,-------, _________________________|"   );
    console.log("     / XXXXXX /`|     /"                     );
    console.log("    / XXXXXX /  `\\   /"                      );
    console.log("   / XXXXXX /\\______(   "                       );
    console.log("  / XXXXXX /" + "       OfficerID: " + result.args.shooter );
    console.log(" / XXXXXX /"   + "         GunID: " + result.args.gunID);
    console.log("(________("  + "          Latitude: " + theLat + " Longitude:" + theLong);
    console.log(" `------'");
    console.log("*********************************************************************************");

  }
    else {
      console.log("oops something went wrong...")
    }
});


var shotEvent = glockchain.LogGunShot();
shotEvent.watch(function(error, result){
    if (!error){
        var theLat=result.args.latitude/1000000;
        var theLong=result.args.longitude/1000000;
      console.log("*******************************************************************************");
      console.log("GUN SHOT OCCURED @ " + timeConverter(result.args.timestamp));
      console.log(" ");
      console.log(" ,--^----------,--------,-----,-------^--,"  );
      console.log(" | |||||||||   `--------'     |          O  BANG!!!!!!!"  );
      console.log("`+---------------------------^----------|"   );
      console.log("  `\\_,-------, _________________________|"   );
      console.log("     / XXXXXX /`|     /"                     );
      console.log("    / XXXXXX /  `\\   /"                      );
      console.log("   / XXXXXX /\\______(   "                       );
      console.log("  / XXXXXX /" + "       ShooterID: " + result.args.shooter );
      console.log(" / XXXXXX /"   + "         GunID: " + result.args.gunID);
      console.log("(________("  + "          Latitude: " + theLat + " Longitude:" + theLong);
      console.log(" `------'");
      console.log("*********************************************************************************");
    }
    else {
      console.log("oops something went wrong...");
    }
});
