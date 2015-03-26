//
//  Usuario.h
//  weAppLoginWebService
//
//  Created by Humberto Vieira de Castro on 3/20/15.
//  Copyright (c) 2015 Humberto Vieira de Castro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuario : NSObject
@property (nonatomic) int id_usuario;
@property (nonatomic) NSString *user;
@property (nonatomic) NSString *senha;
@property (nonatomic) NSString *apelido;
@property (nonatomic) NSString *email;

- (NSMutableArray *) retornaUsuarios;
- (NSString *) insereUsuario:(Usuario *)u;

- (NSMutableArray *) buscaUsuariosPorNome:(NSString *) palavra;

@end
