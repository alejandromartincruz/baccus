//
//  wineryModel.h
//  Baccus
//
//  Created by Alejandro Martin on 25/3/16.
//  Copyright © 2016 AlejandroMartin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WineModel.h"

@interface wineryModel : NSObject

@property (readonly, nonatomic) NSUInteger redWineCount;
@property (readonly, nonatomic) NSUInteger whiteWineCount;
@property (readonly, nonatomic) NSUInteger otherWineCount;

-(WineModel *) redWineAtIndex: (NSUInteger) index;
-(WineModel *) whiteWineAtIndex: (NSUInteger) index;
-(WineModel *) otherWineAtIndex: (NSUInteger) index;

@end
