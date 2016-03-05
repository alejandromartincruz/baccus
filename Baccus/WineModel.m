//
//  WineModel.m
//  Baccus
//
//  Created by Alejandro Martin on 28/2/16.
//  Copyright © 2016 AlejandroMartin. All rights reserved.
//

#import "WineModel.h"

@implementation WineModel

#pragma mark - Class methods

+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) aOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aURL
             notes: (NSString *) aNotes
            rating: (int) aRating
             photo: (UIImage *) aPhoto {
    
    return [[self alloc] initWithName:aName
               wineCompanyName:aWineCompanyName
                          type:aType
                        origin:aOrigin
                        grapes:arrayOfGrapes
                wineCompanyWeb:aURL
                         notes:aNotes
                        rating:aRating
                         photo:aPhoto];
    
}

+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) aOrigin {
    
    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:aOrigin];
    
}


#pragma mark - Init

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) aOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aURL
             notes: (NSString *) aNotes
            rating: (int) aRating
             photo: (UIImage *) aPhoto {
    if(self=[super init]) {
        // asignar los parametros de las variables a la instancia
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin = aOrigin;
        _grapes = arrayOfGrapes;
        _wineCompanyWeb = aURL;
        _notes = aNotes;
        _rating = aRating;
        _photo = aPhoto;
        _rating = aRating;
    }
    
    return self;
}

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: (NSString *) aOrigin {
    
    return [self initWithName:aName
              wineCompanyName:aWineCompanyName
                         type:aType
                       origin:aOrigin
                       grapes:nil
               wineCompanyWeb:nil
                        notes:nil
                       rating:NO_RATING
                        photo:nil];
}

@end
