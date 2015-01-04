//
//  ProfileDataSource.m
//  AnchorFloatView
//
//  Created by Carlos Eduardo Arantes Ferreira on 03/01/15.
//  Copyright (c) 2015 Mobistart. All rights reserved.
//

#import "ProfileDataSource.h"
#import "Profile.h"

@implementation ProfileDataSource

- (NSArray *)profileList {
    
    if (!_profileList) {
        
        Profile *profile1 = [[Profile alloc] initWithName:@"R. Varane" andPicture:@"156706.png" andPosition:@"Defender at Real Madrid" ];
        Profile *profile2 = [[Profile alloc] initWithName:@"Pepe" andPicture:@"4579.png" andPosition:@"Defender at Real Madrid" ];
        Profile *profile3 = [[Profile alloc] initWithName:@"Sergio Ramos" andPicture:@"326.png" andPosition:@"Defender at Real Madrid" ];
        Profile *profile4 = [[Profile alloc] initWithName:@"Fábio Coentrão" andPicture:@"16576.png" andPosition:@"Defender at Real Madrid" ];
        Profile *profile5 = [[Profile alloc] initWithName:@"Marcelo" andPicture:@"17462.png" andPosition:@"Defender at Real Madrid" ];
        Profile *profile6 = [[Profile alloc] initWithName:@"Daniel Carvajal" andPicture:@"145430.png" andPosition:@"Defender at Real Madrid" ];
        Profile *profile7 = [[Profile alloc] initWithName:@"Arbeloa" andPicture:@"5239.png" andPosition:@"Defender at Real Madrid" ];
        Profile *profile8 = [[Profile alloc] initWithName:@"Nacho" andPicture:@"145424.png" andPosition:@"Defender at Real Madrid" ];
        Profile *profile9 = [[Profile alloc] initWithName:@"Diego LIorente" andPicture:@"262202.png" andPosition:@"Defender at Real Madrid" ];
        Profile *profile10 = [[Profile alloc] initWithName:@"Jaime Sánchez" andPicture:@"235945.png" andPosition:@"Defender at Real Madrid" ];
        
        Profile *profile11 = [[Profile alloc] initWithName:@"S. Khedira" andPicture:@"4519.png" andPosition:@"Midfielder at Real Madrid" ];
        Profile *profile12 = [[Profile alloc] initWithName:@"T. Kroos" andPicture:@"16383.png" andPosition:@"Midfielder at Real Madrid" ];
        Profile *profile13 = [[Profile alloc] initWithName:@"J. Rodríguez" andPicture:@"72408.png" andPosition:@"Midfielder at Real Madrid" ];
        Profile *profile14 = [[Profile alloc] initWithName:@"G. Bale" andPicture:@"15482.png" andPosition:@"Midfielder at Real Madrid" ];
        Profile *profile15 = [[Profile alloc] initWithName:@"L. Modric" andPicture:@"365.png" andPosition:@"Midfielder at Real Madrid" ];
        Profile *profile16 = [[Profile alloc] initWithName:@"Isco" andPicture:@"103164.png" andPosition:@"Midfielder at Real Madrid" ];
        Profile *profile17 = [[Profile alloc] initWithName:@"IIIarramendi" andPicture:@"62758.png" andPosition:@"Midfielder at Real Madrid" ];
        Profile *profile18 = [[Profile alloc] initWithName:@"Álvaro Medrán" andPicture:@"279746.png" andPosition:@"Midfielder at Real Madrid" ];
        Profile *profile19 = [[Profile alloc] initWithName:@"Lucas Torró" andPicture:@"212612.png" andPosition:@"Midfielder at Real Madrid" ];
        
        Profile *profile20 = [[Profile alloc] initWithName:@"Cristiano Ronaldo" andPicture:@"382.png" andPosition:@"Attacker at Real Madrid" ];
        Profile *profile21 = [[Profile alloc] initWithName:@"K. Benzema" andPicture:@"1595.png" andPosition:@"Attacker at Real Madrid" ];
        Profile *profile22 = [[Profile alloc] initWithName:@"J. Hernández" andPicture:@"53937.png" andPosition:@"Attacker at Real Madrid" ];
        Profile *profile23 = [[Profile alloc] initWithName:@"Jesé" andPicture:@"160640.png" andPosition:@"Attacker at Real Madrid" ];
        
        Profile *profile24 = [[Profile alloc] initWithName:@"Casillas" andPicture:@"317.png" andPosition:@"Goalkeeper at Real Madrid" ];
        Profile *profile25 = [[Profile alloc] initWithName:@"K. Navas" andPicture:@"42661.png" andPosition:@"Goalkeeper at Real Madrid" ];
        Profile *profile26 = [[Profile alloc] initWithName:@"Pacheco" andPicture:@"164039.png" andPosition:@"Goalkeeper at Real Madrid" ];
        Profile *profile27 = [[Profile alloc] initWithName:@"Rubén Yanez" andPicture:@"262198.png" andPosition:@"Goalkeeper at Real Madrid" ];
        
        _profileList = [NSArray arrayWithObjects:profile1, profile2, profile3, profile4, profile5, profile6, profile7, profile8, profile9, profile10, profile11, profile12, profile13, profile14, profile15,profile16, profile17, profile18, profile19, profile20, profile21, profile22, profile23, profile24, profile25, profile26, profile27, nil];
        
    }
    
    return _profileList;
}

@end
