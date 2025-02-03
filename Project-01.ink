/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots - y
    - Create at least one major choice that the player can make - y
    - Reflect that choice back to the player - y
    - Include at least one loop - y
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages - y
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item - y
    
    cannot check map if did not shoot out lock and pick it up
    
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested) - y
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR time = 0 // 0 Morning, 1 Sunset, 2 Night
VAR map = 0
VAR maps = 0
VAR shells = 0

-> intro

== intro ==
The year is 2354. It is December 31st. The world is not as futuristic as one might think it is. Society never recovered after the war. There are people few and far between, so interaction is rare. You reside on the outskirts of Tulsa, Oklahoma. You haven’t spoken with anyone since your Aunt died years ago. You recall something your Aunt told you before she died, “The train will stop in Tulsa in 2355.”
+ [Continue] -> intro_2

== intro_2 ==
You have 2 shotgun shells left for the old Mossberg 12-gauge shotgun your aunt gifted you on your 16th birthday. You have hunted for your food your entire life, but with your depleting stash of ammo you know you can’t stay here for much longer. You decide to find this “train” your Aunt told you about years ago and make a new life somewhere, hopefully with the company of others. 

* [Gather your things and head for Tulsa] -> station

== station ==
You arrive at the train station in Tulsa the next day at sunset. Leaves and trash covering the tracks tell you nothing has been there in years. You think to yourself, “Is this damn train even real?”
It is { advance_time() }

* [Sit down and rest] -> arrival_nm
* [Explore the station] -> station_2

== station_2 ==
Everything is weathered. There is a locked door near the back of the station.

* [Head back to the tracks] -> arrival_nm
* [Shoot out the lock with one of the two shotgun shells you have left] -> station_door

== station_door ==
The door bursts open from the blast of your shotgun. It appears to be some kind of traffic control office. There is a map of the tracks, which could prove useful to you on your journey to wherever.

* [Take items] -> map_pickup

== map_pickup ==
~ map = map + 1
You know have a map.
* [Continue] -> arrival

== arrival ==
Just as you are about to doze off by the tracks, a bright light appears in the distance. It appears to be getting closer and louder. You think to yourself, “Could it really be it?” 
It is { advance_time() }

* [Continue] -> station_4

== arrival_nm ==
Just as you are about to doze off by the tracks, a bright light appears in the distance. It appears to be getting closer and louder. You think to yourself, “Could it really be it?”
It is { advance_time() }

* [Continue] -> station_4nm

== station_4nm == 
The train stops beside you. You do not see anybody. You board the train.

* [Explore the other cars] -> traincar_1nm
* [Get some rest] -> stop_1nm

== station_4 ==
The train stops beside you. You do not see anybody. You board the train.

* [Explore the other cars] -> traincar_1
* [Get some rest] -> stop_1

== traincar_1 ==
You begin exploring the cars. After 4 empty cars turn up with nothing, you debate getting some rest. As you peak into the next car, you notice a younger couple sitting. It has been years since you have seen anyone, let alone talk to someone. The situation gives you a bit of an uneasy feeling.

* [Enter the car and approach the couple] -> interaction_1
* [Turn around and keep to yourself] -> stop_1

== traincar_1nm ==
You begin exploring the cars. After 4 empty cars turn up with nothing, you debate getting some rest. As you peak into the next car, you notice a younger couple sitting. It has been years since you have seen anyone, let alone talk to someone. The situation gives you a bit of an uneasy feeling.

* [Enter the car and approach the couple] -> interaction_1nm
* [Turn around and keep to yourself] -> stop_1nm

== interaction_1nm ==
~ shells = shells + 24
As you enter the car, the couple appears to be startled. The man slowly reaches for his rifle beside him. I mean, you do have a shotgun slung over your shoulder. Who wouldn’t be startled? As you realize the situation you are quick to tell them you mean no harm. The couple eases up and you begin conversation for the first time in who knows how long. 

They tell you they have been on the train for a few days, and are headed for Des Moines, Iowa, where they think they might have some relatives. You tell them you aren’t quite sure where you are headed. They don’t seem like they are quite inviting you to join them, so you don’t ask. The man says to you, “Hey, is that a 12 gauge? I found a few boxes of shells awhile back, but they do my rifle no good. Have ‘em.” You thank him.

* [Take the shells and go back to your car] -> stop_1nm

== interaction_1 ==
~ shells = shells + 24
As you enter the car, the couple appears to be startled. The man slowly reaches for his rifle beside him. I mean, you do have a shotgun slung over your shoulder. Who wouldn’t be startled? As you realize the situation you are quick to tell them you mean no harm. The couple eases up and you begin conversation for the first time in who knows how long. 

They tell you they have been on the train for a few days, and are headed for Des Moines, Iowa, where they think they might have some relatives. You tell them you aren’t quite sure where you are headed. They don’t seem like they are quite inviting you to join them, so you don’t ask. The man says to you, “Hey, is that a 12 gauge? I found a few boxes of shells awhile back, but they do my rifle no good. Have ‘em.” You thank him.

* [Take the shells and go back to your car] -> stop_1

== stop_1nm == 
After what felt like an eternity of sleep, you’re awakened to the train stopping. “Where am I?”
It is { advance_time() }
You have {map} maps.

+ [Get off the train and explore] -> kansas_1
+ [Stay on the train] -> stop_2


== stop_1 == 
After what felt like an eternity of sleep, you’re awakened to the train stopping. “Where am I?” { not map_pickup:You check your map and the stop after Tulsa is in Kansas City, Missouri. }
It is { advance_time() }
You have {map} map.

* {map > 0} [Check your map] -> map_check
+ [Get off the train and explore] -> kansas_1
+ [Stay on the train] -> stop_2

== map_check ==
You check your map and the stop after Tulsa is in Kansas City, Missouri.
* [Continue] -> stop_1

== kansas_1 ==
You get off the train and begin to look around the station. There isn’t much of anything but you do see some smoke not too far away. 

* [Keep looking around] -> kansas_2
* [Go check out the smoke] -> interaction_2

== interaction_2 ==
As you get closer to the smoke you notice a well fortified compound surrounded with wooden blockades. These guys look serious.
You have {shells} boxes of shells.
* [Approach the compound] -> death_1
* [Turn around and head back toward the station] -> kansas_2

== death_1 ==
Before you have a chance to do anything you are hit with a round. The men from the compound rush toward you yelling. Everything begins turning blurry and quiet. You pass away from your wounds.

-> END

== kansas_2 ==
As you look around you begin to hear the train make some noise as if it's about to take off, you sprint back and barely make it inside the doors before they close.

* [Continue] -> stop_2

== stop_2 == 
The train takes off and you fall asleep.

* [Continue] -> stop_3

== stop_3 ==
Once again you wake up to the train stopping. The next stop is in Des Moines. Except, the station says Rapid City, South Dakota. “How long was I asleep? I must have missed a few stops?” The station says the next stop is in Helena, Montana. "Do I really want to risk not getting back on the train?"

* [Get off the train and explore] -> death_2
* [Stay on the train] -> helena_1

== death_2 ==
You get off the train and begin to explore. You find a stash of old MRE’s from the war. Celebrating your discovery, you don’t realize that the train begins to take off. Rushing toward it, the doors close just before you get there. The train takes off and you are left wondering what to do. 

The MRE’s only lasted you so long. You eventually begin to starve and pass on.

-> END

== helena_1 ==
You arrive at the station in Helena and are greeted by a small group of people. You conversate, telling them your story, them telling you theirs, and they invite you to join their small settlement by Lake Helena. 

Life is good, food is abundant, and you are happy. 

->END

== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 2:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return "morning"
        
        - time == 1:
            ~ return "sunset"
        
        - time == 2:
            ~ return "night"
    }
    
    
        
    ~ return time































