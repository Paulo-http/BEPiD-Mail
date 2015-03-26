//
//  Email.h
//  weAppLoginWebService
//
//  Created by Humberto Vieira de Castro on 3/26/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Usuario.h"

@interface Email : NSObject

@property (nonatomic) int id_email;
@property (nonatomic) int id_usuario;
@property (nonatomic) int id_receptor;
@property (nonatomic) NSString *assunto;
@property (nonatomic) NSString *texto;

- (NSString *) enviaEmail:(NSString *)destinatario email:(Email *)email;

- (NSMutableArray *) ultimosEmails:(NSString*) id_usuario;
@end
