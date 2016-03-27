//
//  wineryModel.m
//  Baccus
//
//  Created by Alejandro Martin on 25/3/16.
//  Copyright © 2016 AlejandroMartin. All rights reserved.
//

#import "wineryModel.h"

@interface wineryModel ()

@property (strong, nonatomic) NSArray *redWines;
@property (strong, nonatomic) NSArray *whiteWines;
@property (strong, nonatomic) NSArray *otherWines;

@end

@implementation wineryModel

#pragma mark - Properties

-(NSUInteger) redWineCount {
    
    return [self.redWines count];
    
}

-(NSUInteger) whiteWineCount {
    
    return [self.whiteWines count];
    
}

-(NSUInteger) otherWineCount {
    
    return [self.otherWines count];
    
}


-(id) init {
    
    if (self=[super init]) {
        WineModel *tintorro = [WineModel wineWithName:@"Bembibre"
                                      wineCompanyName:@"Dominio de Tares"
                                                 type:@"tinto"
                                               origin:@"El Bierzo"
                                               grapes:@[@"Mencía"]
                                       wineCompanyWeb:[NSURL URLWithString:@"http://www.dominiodetares.com/index.php/es/vinos/baltos/74-bembibrevinos"]
                                                notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades violáceas en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado."
                                               rating:5
                                                photo:[UIImage imageNamed:@"bembibre.jpg"]];
        
        WineModel *albarinno = [WineModel wineWithName:@"Zárate"
                                       wineCompanyName:@"Zárate"
                                                  type:@"white"
                                                origin:@"Rias Bajas"
                                                grapes:@[@"Albariño"]
                                        wineCompanyWeb:[NSURL URLWithString:@"http://www.albarino-zarate.com"]
                                                 notes:@"El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito."
                                                rating:4
                                                 photo:[UIImage imageNamed:@"zarate.gif"]];
        
        WineModel *champagne = [WineModel wineWithName:@"Comtes de Champagne"
                                       wineCompanyName:@"Champagne Taittinger"
                                                  type:@"other"
                                                origin:@"Champagne"
                                                grapes:@[@"Chardonnay"]
                                        wineCompanyWeb:[NSURL URLWithString:@"http://www.taittinger.fr"]
                                                 notes:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nunc purus. Curabitur eu velit mauris. Curabitur magna nisi, ullamcorper ac bibendum ac, laoreet et justo. Praesent vitae tortor quis diam luctus condimentum. Suspendisse potenti. In magna elit, interdum sit amet facilisis dictum, bibendum nec libero. Maecenas pellentesque posuere vehicula. Vivamus eget nisl urna, quis egestas sem. Vivamus at venenatis quam. Sed eu nulla a orci fringilla pulvinar ut eu diam. Morbi nibh nibh, bibendum at laoreet egestas, scelerisque et nisi. Donec ligula quam, semper nec bibendum in, semper eget dolor. In hac habitasse platea dictumst. Maecenas adipiscing semper rutrum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;"
                                                rating:5
                                                 photo:[UIImage imageNamed:@"comtesDeChampagne.jpg"]];
        self.redWines = @[tintorro];
        self.whiteWines = @[albarinno];
        self.otherWines = @[champagne];

    }
    
    return self;
    
}


-(WineModel *) redWineAtIndex: (NSUInteger) index {
    return [self.redWines objectAtIndex:index];
}

-(WineModel *) whiteWineAtIndex: (NSUInteger) index{
    return [self.whiteWines objectAtIndex:index];
}

-(WineModel *) otherWineAtIndex: (NSUInteger) index {
    return [self.otherWines objectAtIndex:index];
}

@end
